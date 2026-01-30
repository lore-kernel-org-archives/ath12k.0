Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC86E6BF1D
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBvbdI2G34GOfuAAi5s1uPoIgFs5fdLJlqnUnDwfYVg=; b=tFJtw6sQkhGn05b0qcG48eeREP
	wRY7ULayCTEfbnsrWUr3ED8P+ZnE0VvBCHqav2rDqVXUeiqUhEHx5wv9sJ0YNnxJAJpug5xLUPyVC
	gChFQ3VDhwsS0Y9hdiT5aF/pUsK9ps4q8Cdgv4NAWvctajBOg5w5jvi9XsOTgJdoS2xMJZo0nwY2k
	E3175V+eEN+S1R4FsHJmiErnZxhzWM4/fK8n6xSqjBpHg809qE94gNxOT42rIzGj8fxuFtKubeG96
	3hFJOg8TKIJ3yAylC3jZyerLTP0NKNup8SqURvuyDSBo32ryuDZIQH19zvJ25dN+dMGPyyRXfMXrW
	oVjV0HWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDo-00000001cuM-3DoV;
	Fri, 30 Jan 2026 15:15:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDm-00000001csA-0pEN
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UCWEAq2294941
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBvbdI2G34GOfuAAi5s1uPoIgFs5fdLJlqnUnDwfYVg=; b=aauuBK87ukCUp1We
	ktljfUAqX0kr8RBmOTlfqMr65E/5prbhvInAdvhXbWRNBG6A4AjRjr6iPA7/W/++
	RohiBr7gZJCcmhdZXHrINUXw+kjxi90L/CdsWyKtXz+ACi4xJh8Ci1zaHMVY+Alg
	isp1uF3tvOBQOQoUBZDTHV2OzAmwZZ2kHp9oNU1NKk3GFjvHbwLi+1uh7+sdU6sH
	65V/nqe65WH2CUoPa/+C6nlBP5VzX2W14KwO0LZorV6YVddHMOpRiNrwlBcHK8UQ
	CvpJ8bUG0/aL+WwFOHb4nb71vuEFhBD5DPmeGNVt1OgRq3rlDIVyC8JRyV2en/ZY
	lYCL5g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1x9rvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124a5098029so12091377c88.0
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786140; x=1770390940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBvbdI2G34GOfuAAi5s1uPoIgFs5fdLJlqnUnDwfYVg=;
        b=hMIK990U3IHFzs1FGAC+5BDMSH6RQy3GtUO9Nz5rqII+f1XEBOFa5IPaAs34jhvLiH
         5vp9Yicz3JGIX/A0wIFEVO+MXc0ax9kajJuyFZIH5S4/z1FAFExMjSQouICCCTD7OoEj
         6n0dtLN5Ol/feS8Vl6T53HgVv8tngnoDchwQvh7bs4HIY6qonZLzsJ6MCBKkoA625i8y
         yEgsq4vVyyvlA4TcHOOvp5O5r/qY+JwNXWHCpXpyDHnz8FRNUnCwcvlEVUh1Lo4krGpd
         JesJ1BwfZDwlhzYGW6nrlqfD06yjzYRmtKp8TTZTqLKZ3q3FYJ8Wez6f+rztM3rUohSk
         zhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786140; x=1770390940;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBvbdI2G34GOfuAAi5s1uPoIgFs5fdLJlqnUnDwfYVg=;
        b=hMFvUYessBw4g5RN4upfkuTwqypzCjSvTjZYFt/uac9l7M1gi275QplxgJwe5tclpw
         qHpU5wiVntODhJcES8Z4g/m/XdOpKxoYLqc6OTs3r8WdngcbwIfMVIlx3WqjDBpAJo7R
         RIbbSTmTZUAtGuFT3LFvdS0zaO3NWnO6tgryFYcLCiEKg3woOuz2GO9jD/+DACw+4O27
         2frFS5zT9LG52oQ+ELGEqVNVXyx5Gh0Y6DfYOr0+FxXaWZubG0O4Lzo2EIiPQUZ85wi5
         rYQrCkFAm1EEPUWG9ttbF+uGFt1jYdTjCcuDpg6XrYmVoImF3y22IgeQva6P97AZJjfN
         Jtcw==
X-Gm-Message-State: AOJu0YyCi0ppV7LOLQCZZHvESyXaPdNSON0TRz63bYEd5hoSd11THfbp
	brkyD2ZBZKWCFIXt8SwAYGHK3lAr1sxsP0gg9sihH3Xk6zU31bAteet8Lfs52YhqqnTfTz8dvZ8
	8ZxXqX4VpLlUhnyRnvFaaWs7H35bM40hB4j4T8pJzJVSTy4pfxFomM9iXfRrSWisv
X-Gm-Gg: AZuq6aIL+C3bEoUUgAXrt0tpw928oVV33JcAI8EXXC0VZ2f3Y8JYlb2wuYCiZUc0v9h
	ChIeU1K9RuHBfe7Cwo3NIXdBCtyTQAj2NSLeLgqcHAHja5iLMSmkgRlQTe23ou16+uuvNCiL2zv
	BRMruOz3ehMoBGQR4GGiJnEV+LWeTZtRo0HgoQGSuAFqkWh2ewdkuanMTqxZ42MXizDyJ01vYwV
	dktoAu1mDt2bZW1NLYOnTa+yMXfhRzGfHDhgHggta/GRDib8ZXplQkYhsPKco20Fi+USiMkgCB0
	i+i+MDljsxQfdVemHflAZpVUNsZ/ohaJ8AyEATxKByP+/RH6K4lZ+J0HcWXzoxY9cjXcLM7ZXwz
	arCPQoacCzropeKmgwZQwOrAPtJ2TxqDghoLhOEQRyo1Ep0mICj9Z0wwKCXWeIIOF
X-Received: by 2002:a05:7022:faa:b0:123:31dc:e8b5 with SMTP id a92af1059eb24-125c0f13fb7mr1559594c88.0.1769786140094;
        Fri, 30 Jan 2026 07:15:40 -0800 (PST)
X-Received: by 2002:a05:7022:faa:b0:123:31dc:e8b5 with SMTP id a92af1059eb24-125c0f13fb7mr1559577c88.0.1769786139432;
        Fri, 30 Jan 2026 07:15:39 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:38 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Wei Zhang <wei.zhang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
In-Reply-To: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
References: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Add pdev-level OBSS PD
 configuration
Message-Id: <176978613866.3951544.11589420933593336710.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: KmS_mV_fHxuilEEGrr1pu6xjE_L56b6e
X-Proofpoint-ORIG-GUID: KmS_mV_fHxuilEEGrr1pu6xjE_L56b6e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfXzwD7CEdG4FHZ
 vUnwrZ1PM5sy4xfViSaySzp1iflyV+an+crN6kCMi+d+cXM1snCjitfmNqHtXCsFkcJPtMDRoY1
 YdJ7s8E35ioFqsqyv6ejPMdt8iSkL4khGRVH2p8bwWxp2AfwPIjyDDRsSOxjafgDe9A99xo08/L
 RlGF0m3Vkw7wnuud9/Qw3AeV3jQSJuJF3Gyy2o/hQgT27/GZvMAfIzqR34SCJNOj5uN71DxghvM
 qfPb/f+5GqL4gcVjM4heuRrQCeZ2CgzWuc0zzJbnKP0oGlxQ9per+HhQVe7OloLHkfYLB2ChG1b
 Vefy1upjGPA7RIQGLiamaaR8hFwlSnvVLu9KUuXw1ft38VNQE2E/HOB+wrxOVEzxnH+vBAW9DNu
 3JYJ3RBSEcwq+1RNHu7ZaMqWsvjelW3jmGvsSrLqPJw5jq+n3i4N2JRGa4F4g9AX08BeL34te1D
 yqmkfFFCE6n+vxjRJmw==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697ccb1d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=x-WexUlhkf1kDxQ1nFgA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071542_357325_02FFDCC6 
X-CRM114-Status: UNSURE (   8.98  )
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


On Thu, 22 Jan 2026 22:48:15 -0800, Wei Zhang wrote:
> This series introduces WMI support and AP-mode handling for HE Spatial
> Reuse in ath12k:
> 
> Patch 1 adds new WMI commands, TLV tags, and a service flag to configure
> SRG/non-SRG OBSS PD bitmaps (BSS color and partial BSSID) at the pdev
> level.
> Patch 2 switches AP mode to use the new pdev-level configuration path,
> programming OBSS PD thresholds, per-AC enablement, SR prohibit control,
> and SRG/non-SRG bitmaps based on mac80211 HE SPR parameters.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: add WMI support for spatial reuse parameter configuration
      commit: 6dbd496a170b62c7ac56a0cb3aaf170b3ecbb515
[2/2] wifi: ath12k: support OBSS PD configuration for AP mode
      commit: 7b789ea390457d5751ae5b1ede81ca8564a618d1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


