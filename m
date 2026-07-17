Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2F9C4451C
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ8k+2HIR0sWnAIb7M4o9ugipG6/uVcMWV28VfxSnv8=; b=Ovsd7FWmOhglClL0UK2MJR24Gk
	Ib8XMOLmHC11dCPe+76zS8ClgC0uJnb1q6BF9QwyJ2Jz7WvAgr4GgUf6JwGaCRRCRcj2sja+uEeL6
	MyKsUTNOxEZdSkKxCfAzvtOUnl+8f7Boy+Tv9nup5bKcPM7ovpTK9enOyeMllOR4ng1luasiJ5ohV
	R0s9YS0qsKJtRW3KZHZSP1q2ap6t4KqyWfknN63SKfevIAmJBxy1HTa2hc9f5YZsWR9rmp6s7hk6/
	sMyKPc2GlSvYTHrQC3DrNjbQE1AspOAfx7rjstXRJ5Bu+bk2gI2vRZyKBbXQCxGy8vd7GQtPBsELj
	MEWdPsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8e-00000002YQr-010B;
	Fri, 17 Jul 2026 15:06:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8b-00000002YQC-30DD
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 15:06:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE86sH3124837
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZ8k+2HIR0sWnAIb7M4o9ugipG6/uVcMWV28VfxSnv8=; b=FcdHTkYlRiRCYsaH
	T1UF/0x+W2mTGuuqTJTZRPSZM85x/s7oBTIsZ2lgj3E/Ch/HgfXGvoNkjPQLrYZ9
	p7I4l619uoFYNH6x2d3XV7+jPYiy0qQz6UPQt8e2YuP1ElvEEPXwznHH0bnQLseY
	mbqIZPjpIeDTPg24z0+tNgvyODTRnM56KAReaFu8m56zZVrnz1kn05sT+jz4rWtQ
	T082W0BQ8KC6jHB0QlYHCAVP2p3iqbQsFZEt1DSNpB3cME1jYba5i9dL1NT5VwZ7
	21eXkwYExCXZagxg2JMAwQK3myPDxVUGKzCm8qUuL6FwMDTUEbQmGiJbcxSJfmhf
	vNTyrA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6mah4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1986850a91.0
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300764; x=1784905564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZ8k+2HIR0sWnAIb7M4o9ugipG6/uVcMWV28VfxSnv8=;
        b=b/I4laKBNKoviK42rcXWiPCZfh1zwFSb7rl8sbzJ4g5Nygbwk4QabczBwaB83JxTE5
         cnxi0FXxJNy2VrjZB353W7y2JFNZgrV4DFMhLKh7SDj7oMMj0ACLGkwE8VrfkgouMwAG
         BkWaK8xjZLCoOJfarwg5YzZZA0HwNM8xj4S8xtEJWJfFt/a6uGamkTbAzTmIKRMgxxbD
         6sKVMrWCvzV3GKprdX4+UO9WLGGOidXZgRbbfaVWcfmFw+xTN+yACj+CxrqZXMf45zKp
         ReIKIXHUY13wTUfRQS/v+/lt4Auf47OYeHywgg+K1/ZBcQRWzsT/HtwRuXOHQap5YydH
         f2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300764; x=1784905564;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ8k+2HIR0sWnAIb7M4o9ugipG6/uVcMWV28VfxSnv8=;
        b=TS+t6azLLdUd5KreySUT+gqbdGl4sii32Nbnq5VPK/oxqD9rFv6VKhfWBD6h7CGNrw
         1XRwQx3dSV72X2/oR+kujDrCog2Fzyjk+rHCrlzTBB9Swzh+7fkQ5+ziH47kCmevjTiW
         gOWiejbK90QIsnqWIeEZ3VPCCX7ETTsmjVYkd0yXu5hpx8SUsyd6BHtGM4QtwuOl1nLD
         oys0F2JXO2waARWV7H+bgBCToItmXZKLEWjZyVO9ITl+kihLgdFrCyedm2f9VhV7bpUg
         E7K9l5XG/6VGsKLBTWEFx2PBrBpd+3guWsNzspyVxwkggJtqlb7bTPBMnqjket+psQvo
         0cGg==
X-Gm-Message-State: AOJu0YzBgbEgLTosfTE34Z9P8von+cTaHIjQR+4aLE078V8un57YrpRh
	FcnpnYgpHULbeAbhvOBZUwQqG9CtYuI4Z7ciUKqOi4DEQpr0Kg50lTUp6E5w9AfCnsscfo+QMkx
	P0rAzWqu4fRE1AsNDhl7z2hhL19Fik76mrU+GTsGXX5wO8QmO0B/oHGNYMfQG36dv
X-Gm-Gg: AfdE7ck1dq5KkAChgu6rfGENXh5WmzGgk7NNBQm7FpHRQdFIQJrSFChQlJKAKEPEbTq
	bTHMrfub2YWgic/64L8WYhQBYBir2cQ/Nw4/1mp4Q9ZTFPHwycSEwZm/YsgtDb2XLan2lRdxaue
	igZddHNq2XMB5XmonR335Mu3kd+FMCNm2Ooo4oUaaQCv7/22+xOoa4od5tvUWMYxRyPsVOBk7KM
	TV6lEr8PjmKHxecwgN6/AByQXF8JOHfi5jyVXXX+oimHOoZAKbTxUWGmEgMxStPTpd/7XC7XZAR
	9LN6uvOGWJyFX2W5ozmopH4XS2Yb+HRn8/70d5vYBxWZKhuxnR+QfVriQHvK23ex1zUvBaAnbx8
	rgbNeAlSEYzm0dfcR/TTsT/PMMuLiCilL75RFoxR+9WO/vDR/83/LWc4=
X-Received: by 2002:a17:90b:5686:b0:38d:ee5a:63 with SMTP id 98e67ed59e1d1-38e3d175d29mr8152973a91.7.1784300764347;
        Fri, 17 Jul 2026 08:06:04 -0700 (PDT)
X-Received: by 2002:a17:90b:5686:b0:38d:ee5a:63 with SMTP id 98e67ed59e1d1-38e3d175d29mr8152929a91.7.1784300763828;
        Fri, 17 Jul 2026 08:06:03 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260622062614.760166-1-thiraviyam.mariyappan@oss.qualcomm.com>
References: <20260622062614.760166-1-thiraviyam.mariyappan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Set congestion control max MSDU
 count
Message-Id: <178430076296.128359.11405301359241550671.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:02 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX5O9aaj0j1mzS
 7017rI7JJiOQtwTQHqPlpzg2JOGWXHBTD2tviOfI883PphmyYxSiyqkZ1tbRPkVJCrP5zDkY8Y+
 5kZUF1t/5UqHXcT01wFAAmKGMmQf3/A29gtbL9odRcXyF0Niy0p/99vNy4T20NB4de/pShE6Bmm
 oFiFYB/v0xKu50EM41W/7yJYARvG34UaVS46BKvD9AyvPth3EubEZQeAX3NlJJlTAEwJxgrGQop
 /Q3UYXdIPGq6AIzpKROhsvhoEfGZk4608Y9snV4n2pg5b/2mnfXj08kEmzzycbOW/mrya7xhveu
 Guq2FJ8suer1mJmlctxfIGnowgYSyJxncEyI9oWzelHfPGMDWB36dMWqRY4Tgo9T7Wo3VQYNYbl
 u9sqLQEdBbK4dSACe62yOmIcKl+x97gsV7ok6iiZT5pqb+aXHFSZf3r72h9C4842XC7yGI4k/p4
 MY8Pnl8grKxgg34LbGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX2xgcbsHpNDOt
 5Uo2pTiWf4ffA3XoZMxHF2K4hav6vLIjtonpYIlU/hlsK/k2IgK4qFlx6uQJazGmLiJGrl8pfJF
 HgWugSMVmF7BqfcEvfA7HtPOJL6KCvs=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a5a44dd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yr5zLEcqeAOy5eNwxqgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: t0kosOzLIPdAVbf8L2rIxjEO8aYjD55-
X-Proofpoint-ORIG-GUID: t0kosOzLIPdAVbf8L2rIxjEO8aYjD55-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080605_763238_6AB3D4EF 
X-CRM114-Status: UNSURE (   9.44  )
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


On Mon, 22 Jun 2026 11:56:14 +0530, Thiraviyam Mariyappan wrote:
> Currently when running 128 clients UDP DL test in 5 GHz HE80 (NSS 2x2),
> firmware uses the default max MSDU count (16K MSDUs). This lower limit
> causes the firmware to compute a smaller TQM drop threshold, aggregate
> packets at a reduced rate, and results in increased packet drops with
> TQM drop threshold as the completion reason.
> 
> To fix this issue, set WMI_PDEV_PARAM_SET_CONG_CTRL_MAX_MSDUS to the TX
> descriptor count using ath12k_wmi_pdev_set_param(). This increases the
> TQM drop threshold, reduces drop events, and improves throughput from
> ~722 Mbps to ~1060 Mbps with 1200 Mbps ingress.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Set congestion control max MSDU count
      commit: 78ad50d9071d07510e190d858a76b27a8339932f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


