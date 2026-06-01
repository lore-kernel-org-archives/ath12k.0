Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C89ACD6E55
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RRsCzDAhUlLG8Muqh83L7tWWVDFU94FMZM+R5qrMjQ=; b=EXy0FXYMzm4A+ssJehDpdqocxX
	uI7eh4GcxS7fSNrTfQv++RwSv2hF2UNAOfK1vUcAxWyXsBRIydiKw8FchtGJl+93TEvf2XlM7CyeU
	cXHPWCRoMRFH2siIa07zzy8Vcd050NHxsqyKQ6BPUZbpgLSm9keILJQsHSYfydk236GcPm/s4DO/z
	VJCfX9uhVf/w8i4ygxjjSI0oULFIg85JdsjNvF6l4Jr9QT0JkE/X8ZWqHV19AWyUz9MqTaxtmokis
	ysTninEdI3smDXaYGbTQsb6Zj8p9ynBnq7hBRWuf1DyzJhSfCiBszHfMg4ioxg84nPi11VWWUT58p
	XlWR9GSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60J-0000000BX3Z-0wPi;
	Mon, 01 Jun 2026 17:00:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60G-0000000BX0V-3vPw
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BBQSB3128747
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RRsCzDAhUlLG8Muqh83L7tWWVDFU94FMZM+R5qrMjQ=; b=Nh35qXoLEeGRRo5W
	g6xJZ6e2tKBlDmWUXUDSgqyQJOxDoMMV80lmD6v5gm1j8hh45VLPw4c6nd+5hroD
	YJ+Do2me+soHVwdwxPb/69jVOoHkV6v/GEhHuuy9e+beGZnJLVDQiB9UAOfIAJzu
	vFBwDxOKF2sx5UvOTtckG2tKYloYh4+YsXRJCR50ZbRtMVKYLIQ1oWb4eSp2nc/y
	i2H3vFkm6dhLI0SlrWQBcW6jzfuhHAWd7SKJ4ouFbyTzX1a7Tiic56lGkGhVOI0t
	gA92dEiBC3r0HUEYIxWT0a45nraU16/vNASVSAKuGRBAWDug+ShcU225DslRUR1R
	wPnmnQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9011fr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1370417c0bfso5664474c88.0
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333239; x=1780938039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RRsCzDAhUlLG8Muqh83L7tWWVDFU94FMZM+R5qrMjQ=;
        b=ZCA1WaVooRvK+PiBXjPj7opW+gH+953sId4TquxeYkx5hlqda4VxCVQ81UQmazn3OU
         scl/WnWcwwu92myb7ST4UxA44tZsLcEBB2LL1FmttYzObIqgcNtmItbzHH4Qu/RAdJzD
         oDHV8bal2yE079ZBoD670p/qMkclGC7w/mJJvoAdZSsBug+RIHG674j+oRPuGflCAIus
         hGqWECkmLRVfs87Vx+zChZxwsjoup0W1kApsgernaHj5+JWi3qHoCRe37oSDer1amMJJ
         LLv6A+19TWbsq2JaZP0+r5kQkrrKip+6bsCO66t8Zdn/8341yibyvUHNbeSAb0F606GV
         4lLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333239; x=1780938039;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RRsCzDAhUlLG8Muqh83L7tWWVDFU94FMZM+R5qrMjQ=;
        b=dy0B9NEp5W5kuFCbPWYH6KkSJqoynCyw5RfQTbiiYbh7glpYxYfHWYwctkDJ6Z8g61
         SSEUel1nE8/LTFGcnA/PuPlFLDnuF6Ju+SjuaBdQjxXCMN9vOXv26r4E4llv6cUiyFTs
         sfJCCBGq54jiG++pwUuyaL2jdpsmoM+0/4WSqOlqvodJscSG0AjKl14PoxxK4ynVpf6q
         2CQ8EywpI8c3fX7HsTbWUqqH+/vYLWjdvagjRoAD17hLdkdSrplIIEtH5hvz6lKGgxak
         yA742x6W9on3v73msSUofMfOCo2/2vRSjHXvMx88LG6BmFsKZvUiQtsuSs9ICpMXs34s
         VFjg==
X-Gm-Message-State: AOJu0YzxKMNHz1ab+P/OmCnjX+U4bjJ7BEC0HritvbGFTES5lAgU+pet
	v6fAqVWi2Q7SIAsaSsPtcXi0pnwgdZNUBRMB8PLqCVK2ef55yRQ+moWvbRGKRIVDgOjPyrWFumb
	wZUaZ5oED6BwUA7GLdKDUdDm46IAJfQ7tWmF3WvfurhKVU/2fjo6f+0sHkaf4wr3Y
X-Gm-Gg: Acq92OFeZFSDdi+2VhaEJOZt7CAnQ75oUtzZlJfxmOppTpMXq1ce8MupQIbr2jo9/Gl
	e18W+t+PuGBDF9nh7tu0CvnLxMCe21D5wfj63McaU3KHUJ1Ufa/PH/wdFrjlWrd6V8Div3ZQrJS
	sEwK+SjRpn+VALfMRjwVz0EpVnOsStR9KalmqSdilzz2AKUNR+4JOjlU/+6gIrfNWNcfYhhJv4X
	2/5s231/Y2UQvgm8RtpG3gHp6DhLMnXucz0+TDKV+EamXcQZYaPDyHL3NkTD0eVmocruRKc6qVV
	f4vgo7Hb961R5x53P3D5X8XViaLOGfyayA0LebDz9Jwbu2tnsmaCyPwgD7nV5kGjOb7Q83l3fet
	Z6zWeAf5dwGd0J0einYSJi+9yA1UVSFIpvcYyylwxvuIQFzMW0hsbAacFU3XB1QE7nS6f7uYBxg
	vLdxzjR4OkXRI=
X-Received: by 2002:a05:7022:1002:b0:135:e8f4:2926 with SMTP id a92af1059eb24-137ee08ab8amr151576c88.3.1780333238613;
        Mon, 01 Jun 2026 10:00:38 -0700 (PDT)
X-Received: by 2002:a05:7022:1002:b0:135:e8f4:2926 with SMTP id a92af1059eb24-137ee08ab8amr151486c88.3.1780333233786;
        Mon, 01 Jun 2026 10:00:33 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:33 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
References: <20260512021108.2031651-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix memory leak in
 ath12k_wifi7_dp_rx_h_verify_tkip_mic()
Message-Id: <178033323299.2045173.11452905816868996849.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1dbab7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VbIn720rbYaXAQPOSzsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: gxlkuCo-6wwIDizfOrbr1OC-Ql75rZnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfX5b8++lRXX2+m
 vXT8UP8axyP0GwV76Gc6XQDGaNqeYD0/JlsSZeAsazrL69He0rxEYe7J024xDyGXL8pBlRPTFCX
 KORtuLXbbz4yUOpa1uKGDiWE2dd/7McHwfL2PzzSM7rZa8kzZ0j6xwVdiHpQL2Fl8wTbmkEH0k4
 aroTJYfih6+bQVv7Doa0RDL96pamMtj+X+byBsxokAs+6MTUk/3LFcEgnCLZkX2ifk/7xsCUqvj
 caWR+GRWsgX/fSfgwT1b0y21EWf4eS/HOtlCYS0WuJP8bdYhJiyEkHQDvUwhtBhnXazh130gIvD
 wbQS3dKO3AO4pxPEr52HWfivce8EJ5af+HOqQLr+W8vlcCUDF2bNDP0dwl5zzE8mREXCYtPTZ8Y
 3oTLo+5ooCpwMohnevCpY6LyQJ7TNgf8OtnZU1A5hdI+J6DQI4sUEpctt/Z9Gu7m0UT/vKuceWY
 YSj5+FAXPlm5nPN84Gw==
X-Proofpoint-GUID: gxlkuCo-6wwIDizfOrbr1OC-Ql75rZnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100041_104688_CF3491AE 
X-CRM114-Status: GOOD (  12.30  )
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


On Tue, 12 May 2026 10:11:08 +0800, Miaoqing Pan wrote:
> In ath12k_wifi7_dp_rx_h_verify_tkip_mic(), the call to
> ath12k_dp_rx_check_nwifi_hdr_len_valid() may return false when the
> NWIFI header length is invalid, causing the function to abort early with
> -EINVAL.
> 
> When this happens, the error propagates to
> ath12k_wifi7_dp_rx_h_defrag(), which clears first_frag by setting it
> to NULL. As a result, the corresponding MSDU is no longer referenced
> by the defragmentation path and is never freed.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()
      commit: 98d4f92ab6a1af2ea2ab590d7e2801b203110981

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


