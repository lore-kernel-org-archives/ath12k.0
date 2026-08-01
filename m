Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CBFC55173
	for <ath12k@archiver.kernel.org>; Sat,  1 Aug 2026 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSgnhMPB9z7atmQR81PmgyeUy3N5ZUkW2ThnjxuGh3U=; b=L+8SeiDNBzm35MQWK26gK2L2RU
	nZLPGj3FmqeInjKNmYIvIlIdqoCEkeenp1i3Xt5C1mkx4S4HmqahvOUx1YMPABIfwFml1A+X1SMXk
	mhvfXl+oge0dkxIpxIafYi8WkLKqcpGY3vcDSKyENSKhXsgdnj9twPw3hUmIffNn1iqf9eui+CQX+
	7ezLoQuOaAMb4cak/gL3dM7d86FO59N5lS6T+cO/6nJ9yf7WGn0DORFpgBMt2LFH7vsevZzW+DwCe
	CZcmuE4IdKd8Xl6STEQ3Eqtb7rksF32dsYPVqO7WGA4G0nFeoPrYx4F9g8X8JHsZ1wzJpgRmlQ9jy
	Y6k6wpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqC3t-0000000Epmf-29Xs;
	Sat, 01 Aug 2026 15:55:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqC3q-0000000EplV-10dy
	for ath12k@lists.infradead.org;
	Sat, 01 Aug 2026 15:55:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FaiEb3183703
	for <ath12k@lists.infradead.org>; Sat, 1 Aug 2026 15:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DSgnhMPB9z7atmQR81PmgyeUy3N5ZUkW2ThnjxuGh3U=; b=iPdcZfEMqKFpP/Cq
	sa5OyHAZysOCyu/xLpmdEsFq3tze5zoBIDuh8aR8sqK/2ZOfJPhjjzD/L7Mse8dG
	/+RJ7b6j9psDMdxj1lBCWubzEefMB3DswSwpxmC+URU55HrmBnZ8GsE1EYmVThHX
	YMPlZ1vn/lfItQBgQBe5kXhDIzFbttYgcnuq3jzG1iHYFfoNP5lTqDSj0EMKU6zs
	q89CiHkQwsGDNXu2NKyDSITfgbDHt9hvbP6k/w1eYzi3loC8b7fhy7khJmBKcyPX
	OGBjpbml0/1oeWZO/QpavqHJBoGRiTlrJd8wh9nVOUJ5clBC1Q9zXQ6IROu+Eoy9
	tpbh2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs309-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Aug 2026 15:55:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso28268305ad.2
        for <ath12k@lists.infradead.org>; Sat, 01 Aug 2026 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785599735; x=1786204535; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSgnhMPB9z7atmQR81PmgyeUy3N5ZUkW2ThnjxuGh3U=;
        b=fyHepZo2CmZbKs4TbpZIDg7GtbVVXFijKjlkCqOPcJpEzVV9nxVXzeE8v7IJv0lE6Q
         DW+0H6IYEHgovcDHJPgkaeDR7pKi+uCbdqw/EE4T7aqhgR+yw+nPg0cdy4dMVGx43UBl
         rT+3WoM5lYnRVenX5z2M0HAR6E94l3fkyKLgmQkWoZgRq6xYIxJBmRG58mX85TOgGS/C
         v3l1xDZUUs/8GR0H6yRF4N0audrm+EcHW+lqqw6qVjecTL0O94S8iaBNjWBHzCepKt7G
         EHDOcq0Q322ZnXeU+Eb16t4U3WBwp6Rxv3RT5GvaxFcraqYXcZAaxFfI4QuXoWKHWsiZ
         pVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785599735; x=1786204535;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSgnhMPB9z7atmQR81PmgyeUy3N5ZUkW2ThnjxuGh3U=;
        b=WFcolbSVKqF8XpzmmnNsuYv8BBB/VQ/e0rmowEwFeME8CQ5ILJZzh1y1W+xVAgFjVY
         Yhp89U4LQJcLh4VoQsrjZuJmYc3TJqU+ezVSxFPqWaNkPj4K0Hhe6rljNYLrt7H75yUZ
         KA9jvUmzeFRUFejH64kYi69tv1t7dA1t9+UQTnC24ZFipGxEMGj7R9XSjAsA6F6uoYii
         BfUjRaQcCU/yvnDsWaIw2YCHk0d/qn0lBP0HGDmj1/h/vNKn7PV8J0JMbd/C82yX1V+8
         QP6ek0A8YmnRcm+G7jqK4fav0Ze+vypof4Zih27jfa5dQOz9cyxFIo88sNjwXH0RKavv
         Wt3Q==
X-Gm-Message-State: AOJu0YwRhnmjzicSCo9AbsYfbXGz5jQedwiNa/cqUlRZ07Tk+ipXmvNz
	iyLoK4BWW4+Fi4NFb/MDLWpLI+21SWHXvthgtHmhmYNfyumgqx1w7XEs6he3dChksQrO3JiBC/7
	lsLbbQd3bkdJ6wn9Oo000pKdicfm/7TbLHAbqC5sP0j+9MgTmW2zXmRi3EU5VFZ2T
X-Gm-Gg: AR+sD10+yqZgwhflykc/9t8/4wK23dVdnSAO3DrDjnuNZoCruSHHY7NLhn0FGDGJf5R
	KnA6dtcaggy9CLOgtW5JflUFNuwV5Aob3DlCGIfGCDqsB0yqyqcOfXBDIxTYiiW+fkY35PcnpW4
	xqOG5gSUemWunS8T9PxUWJxnSFMTEKvKP4aZgU/pP9ihHSBwvTH+dgNA9aKIdg8p0HJ5F9V/0c5
	okXJ+QzeOROwrVMa1D97+jPkVD8eJxvcDy43DnAyYPyLUjH15DVLMglAa18FLpl5TQs53zKYra4
	SEcPZVghqmnwqp1Sb5htg8q8s58B1iIYL+MgV1djTn+TMjy0YitXL8Si6j4vcx5P5aoJARoi0my
	IoTdLJPqy9BPR482JubHAFtdv9zfPkDIWe6+q4zNncNpSFcWqHWl1k0M=
X-Received: by 2002:a17:902:e84d:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2d0521e42c0mr39008285ad.17.1785599734914;
        Sat, 01 Aug 2026 08:55:34 -0700 (PDT)
X-Received: by 2002:a17:902:e84d:b0:2c9:c083:cd50 with SMTP id d9443c01a7336-2d0521e42c0mr39008135ad.17.1785599734403;
        Sat, 01 Aug 2026 08:55:34 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm17110636eec.1.2026.08.01.08.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:55:33 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Reshma Immaculate Rajkumar <reshma.rajkumar@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
References: <20260729171732.668367-1-reshma.rajkumar@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix encrypted EAPOL TX in encap
 offload mode
Message-Id: <178559973349.3865089.16412891730483272241.b4-ty@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 08:55:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZLc-3zBAHEYgpvGGb0tNzlJc5-Hk82HD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyOCBTYWx0ZWRfX2nGmDEV1Iw9d
 JSoAJ9hmTjuKW9wW5f3ipPZXaJwDjIc7UFsT2HUeogvvcH+HDXitAsCJju1Vjg9YPnFWC0yTHdx
 PaEr3O29T965qoPXnBGfMQxZHgxIUfk5jazyUfBpHw8YzOxBHmNS8GINNUkpIfnP31NAbFllG3W
 YooFupwWV4aNTrzi/HkmbOhP0IFoB1GQbj2Cn/9D4PbMTABu62Uf2sFQ33lTZco3gjglBB189u8
 HsslvBPScu2xn5Y7GDA3CbpXLRIhmR2VwY9tFNFSSgtg8YnTrLWPe4B01un8GP7xqy2J8/ZWQwR
 6wF6rO/XcAQ90OK7T2Watr+I79saHEycYu+9D0M00AhoEA/TwchzCGVNqZDLJPsz9SP+OUcgyfx
 Smc/q8lNQlm4Xj61HAH2n/YCcyXeAIEuvO4XSMmwx6xdC2w1+jjbNh6gFnSsBj31FihretC5mde
 o9ddhEhvYoitg8zsH2g==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e16fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fnlUnMmD9_IGKKdQE-8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ZLc-3zBAHEYgpvGGb0tNzlJc5-Hk82HD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyOCBTYWx0ZWRfX0gr73RcxaAIV
 XBscFZflkmMuU4RvfkFqgFq3G1sci1kXqpyHGx+Gv6VBt9606VqKgXm2/HIxBspRcr9JHeMKc0g
 X8Gjq/Trs8udOKZBcvGxgbXvPsaUCyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_085542_311966_0DDAB40F 
X-CRM114-Status: UNSURE (   8.61  )
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


On Wed, 29 Jul 2026 22:47:32 +0530, Reshma Immaculate Rajkumar wrote:
> When a vif operates with IEEE80211_OFFLOAD_ENCAP_ENABLED,
> mac80211 delivers EAPOL frames to ath12k in native-WiFi format.
> 
> Unencrypted EAPOL frames used during the initial 4-way
> handshake are already handled through the existing
> is_diff_encap path. However, EAPOL frames transmitted during
> GTK rekeying carry ATH12K_SKB_CIPHER_SET and continue through
> the normal native-WiFi transmit path.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix encrypted EAPOL TX in encap offload mode
      commit: 1e33f8acd837420160ea088160d8648a3db54c3b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


