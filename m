Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0864C98325
	for <ath12k@archiver.kernel.org>; Fri, 25 Sep 2026 15:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kalpc+ehVtKWOvpdmZ6pUsBPjWV9oQ3vkA7/FsaCrhU=; b=ITCrREicq4rSA9JPTDxFfguPU5
	3rxaiZk0gMgj5NXDrK2gXyWL5tawYeElvaKLuLmCJmyUP8OkPZt5UmpuCpjEot55eCipky0v6772C
	kREp4eqvnxPV7hSXBIZOqcoiDx/alcXdHOJa5GUbUe+SCkJDTSSYXaizp4Mt1J0zeTuxKnzRkIiGU
	XLZHLi+irI0CYa4PPVhvBBapkeLRjqL5ADdPESuU0UlEGh8+kDd3ypr+B7UYRQSd8SWBSyfqp6BIR
	O2yMGV7qnZlpCWb0xcwjyZfvDiswB417hJfUFhp8x3o/fQg9QNX3rqvjVKTa3S1iR1BlNbKpzcvQo
	wkLVzpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pI-0000000DmdW-1JS3;
	Fri, 25 Sep 2026 15:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7pF-0000000DmcN-3qG0
	for ath12k@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Kalpc+ehVtKWOvpdmZ6pUsBPjWV9oQ3vkA7/FsaCrhU=; b=OHZq/j+nf0uIomtStJTBoFTLa9
	lsVbqNfOXRriEZQgtyyKxb+QOmtwkircYUaAkSfap6g3srSBCtK8SV044E/okSnpt6bHZoMO7wsox
	uvz3EfxE3TWEMUNbi9oI3g6jzs9XgADogvmsJZxw26cI2QSNyJipE5DKKZxhE9MfIU7RKgnYt9t2/
	T5OYR4Ch8NB5pnvHLptAx7XyM8/ea9LB2HKf6p3SD0YaNCP5YThxtih4oDxsF97b0WWJmjN6ZxosQ
	21+xt+BmV89M2T563j/sVgWQ441aHQvEjOjChaxl7dqvouzyjZvYF2aU1D4t+5zTLChhptYa6G3FD
	C9TjE5NA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7pD-0000000H3ig-02Jm
	for ath12k@lists.infradead.org;
	Fri, 25 Sep 2026 15:27:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLdUT900279
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kalpc+ehVtKWOvpdmZ6pUsBPjWV9oQ3vkA7/FsaCrhU=; b=OOndOLpvVZsDNDm4
	S1SMM7gbaddjt9qB6LQ/dfn4b58+sQKw6H7j7MS8W1A6tG6iZcu4hyosSBPb08ah
	Rz+Qk1vTA7qou19IYgDXouO+FwQvzMZ+elLS7Q3/I+na5W2e4SGyE8R9T2IYKF9b
	wezIOwPYeOWI17bEeP0CxjHttQL4uBeOZhepmD1NkDdk19RJ3umZrxrT7ZGPuWiy
	jUfWsyqIqpzfLUEtz2vVXPu0eIasvq6RmMb4qbtIOmFtUc2uEGoLuuEWt5bamLr2
	4inNgL7DZ7QzYlDhnkf2HiEviR/pEjLX58Mb7cyvG4zIe9Hb6hDEf6KLsGR7NygR
	/mNYUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100sp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 15:26:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3f521346so1128528a91.0
        for <ath12k@lists.infradead.org>; Fri, 25 Sep 2026 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790350015; x=1790954815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kalpc+ehVtKWOvpdmZ6pUsBPjWV9oQ3vkA7/FsaCrhU=;
        b=a48tPd77PUoh1aAOedatpRdk4kdTSdSpDQSvesKNligOTO/aB8xqn26+rdrulePC2R
         GMshEsrtG+vZ910b5HbedQJKNGN8y7Uu/Es0Xe/1y0Nko5wHtSl4DiOONoSHKdoGSKvk
         LF3MH7scYrZ/0XU5ucqhZwhZkBaWNQIDoyJZv+N0UHTTAmATaJvonS+g48s0OLPI8ooW
         LTZqRVXXH4MDRHFRPEySu8mEeog919MHZVLtBqg38SSrp0jVrvE11FDDF5y6qKXAf+n1
         OPh9p/WL2Mgt0CfeAqq1QIHQWPf28ZW5d5L/Tav2s+0aXB3eA+/5hqz37Fn3pbGnfi5z
         5bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350015; x=1790954815;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kalpc+ehVtKWOvpdmZ6pUsBPjWV9oQ3vkA7/FsaCrhU=;
        b=jQr4DkWl1habBwbrDFXRWTN8AYWnO+ugooy4ROYNT03fRUCcQNEBgJTx8sMSxSdocD
         zKKmNqPaRJqAJc/kc5vSifePehQhLpZtqyHuaJLe7rWaYXBvWCo6KSwr+HgyZzlwdW7M
         2K+vdrIuTCW3+jlwHoqIHcBNAJzQw5ef56sflfZMWZdxPCfFOBwCxC0XptBVt6qaBDr5
         j7SmKg/Q7H1bP7MVqzNIqKQscwlS6BO2FXLaBV/UAcD82ZZqIVXAX9WOFcgOIDA7t48r
         N8p0ZKMwrIGSzGNQLBIThIJ+leGcxRQshv/RLiTljeA6+1hFf5EjT7GF4M+Annhjg3YO
         4DmA==
X-Gm-Message-State: AFuF++kczw6jQDYrShkYsPetlWy/jytw5VZ+MnBl5mIbySwt8LITj+un
	Givgk0dIixt/1khaqbC1jyyHf7DgyAqJSIdQzbR/TwjdvLyfBUnG18QljJrWfgo4M0fxYQhp8b4
	rdfh1ZRs7yIzCiHIUKhZMC9JVyg1OIU9kr37aJywqX3TOOoqOaK1LpHU0b3exMu3IZrYX04gQ
X-Gm-Gg: AYBFou2m0SIyO8x9bkFM/NXwIexOxBbRSXH4QVkxAa7jpGpvUpWUUI0mONtkx2z61vu
	V+vItRvC3Ua5xvlzgbG7FZ2QcfxA1YWS2ZraJP5qzMWWzhIy0aOAMjqGGbOnm+waK6EsvJ2HSKD
	xmNkbTdFEPGfBSphbM1OkvvLwW2GEmAmYutjD08sdAN6+rYEoA4BYbgN7AYmEj4l4slSOXAaBso
	4rfyndYvraMs7F9mjZujKv2sYXfewa8AaOmGAC5s4hix6YBWhrWEnldk0zoWTkvvAIVXL6EQ0eV
	6a0sNdQdTkobf06DbZjbYksg2JRV6SKtaHnFllYGBW6U7J/m1c0oixHwhfaz9scUtXgb75iOxAD
	cxTlsxbdndPDXEse9MnlLMDGlOBE50eHBiekcK4OLNNuM4dcISVY6azc=
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr5397876a91.47.1790350014922;
        Fri, 25 Sep 2026 08:26:54 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr5397862a91.47.1790350014332;
        Fri, 25 Sep 2026 08:26:54 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b898cabesm5320405a91.0.2026.09.25.08.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:26:53 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: fix monitor RX buffer
 lifecycle issues
Message-Id: <179035001295.3875741.9230088597686770620.b4-ty@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:26:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX6pDJSqFXbg8M
 GgIJ25x6GYL8x2HyEsfR4zDaeROAdHVbqlu+ijjzVXBpGjB/ap20uOW8BVDB2LW97OEMy+Jq34A
 6zHn+NYgFa2wsqIav4S97k0lMfr+UoZPWZHW54xGatWdTp3cum+xsMy1+FAetZL3xyGKAPbqTuP
 PD8luwd3AOYesay3DlXL2m8rAYUBXbXu8llQaS2pEvu8gmRsfp3Y7Uc1ogdFEj+s2Avvjh8yJnm
 KEVejhXJ5VJXihijMHJuV0Sr4c06WPHrEBXlTioQEuDueyZrMUmSwZ+Unc/h0JKz2zQXluIMl3Y
 1769COsk3i9tSaS7oZYsPAnegDr/7zW4qBdZJT6v0VkX6FezK+YfH1Zhusx72Bw4LvxRuBaIeXg
 +dSztVB6HUeqEVj+VZO3AOM2ff6QhRamBOWzPBS+6TIQuGSz6q2ivQFHDlEyTLBSAlLuw1WE303
 Z3yh2RooiHdbIe2E85g==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab692bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jeZ2dEGWif2cJ8v1hNMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZEhD87cKwueaeYdnKIFe_XNvopNrvMck
X-Proofpoint-GUID: ZEhD87cKwueaeYdnKIFe_XNvopNrvMck
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MSBTYWx0ZWRfX2gR9ZgkZOHcw
 3kdBWQCGsXkcXugkmQrvypG49dRVU05AdLmYgQBKfMCRLz84+U1sF55YhsRzrN+KyJhuQCn8wao
 4m3jQsiDY+Ma7pV8QdTpImYiVv5i0qA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_162659_316887_312F08D8 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Wed, 16 Sep 2026 14:03:19 +0800, Kang Yang wrote:
> This series fixes several monitor RX buffer management bugs in the
> monitor destination path.
> 
> The fixes address leaked skb buffers, stale monitor descriptor state,
> object lifetime issues, and incorrect DMA unmap handling observed in
> various error and corner cases.
> 
> [...]

Applied, thanks!

[1/6] wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
      commit: 4dfe8e3ac731c3372b5c1f1f73b0676c301c3916
[2/6] wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
      commit: d8e8eac3fcffc114a79f7d07d7cb73cc16645381
[3/6] wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
      commit: 1a10a558555072dba8510ded23a9174b2a00d079
[4/6] wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
      commit: 8b1d2f4c3805b9f1bddd5dc3bd241edd1f9ab2d9
[5/6] wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
      commit: 97b144b82e2388efef1f78269626d61de0480feb
[6/6] wifi: ath12k: avoid double DMA unmap of held monitor RX buffers
      commit: febe1f8cbccc3434790bfc4d94d40c9dbd803065

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


