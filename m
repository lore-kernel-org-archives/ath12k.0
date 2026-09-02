Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F85FC624D0
	for <ath12k@archiver.kernel.org>; Wed,  2 Sep 2026 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF1N73AUgFMEsW3Z0Jj1FP1jxQJauSxNOYM2tnE84rU=; b=yvuoOf/kcXXVBnh8km4RKrQs7i
	AQY4rwcJz28waKyV7t9qtHzncSplGUngxVTy2bVbcTPvcFACfLEIp2dnjrE8DcWmONk566Pb7RoFw
	JmxW8bmeVJS2Siqqxs+BvKZPKdqYvwjI8aivPAd+R9CayNNu7ZiyGYCQqgG/0uR5M3e917XHHf+hK
	+BT2xH3w5dK7xWAglFM+Z0JdaT0/xS60TZofc8ieRbXgnqkzHC5Snw1APM5MU8nGwmDvrRGiBFh+T
	PLEss3a7/Shi/DhNmpxdfyVMTN/vqGXDHRI/+e1wjLi4UpEjkeVVEMladV+SXzbG1uWDowc6TJKwS
	XE7tcMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iRD-0000000ENiz-0Hmj;
	Wed, 02 Sep 2026 10:43:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iRA-0000000ENiE-4Ae5
	for ath12k@lists.infradead.org;
	Wed, 02 Sep 2026 10:43:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NHRh1239406
	for <ath12k@lists.infradead.org>; Wed, 2 Sep 2026 10:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sF1N73AUgFMEsW3Z0Jj1FP1jxQJauSxNOYM2tnE84rU=; b=esnWfu9OYalq6NeO
	HeBcNeN7XV0o0FKpcMImL+vAMi3WXNIijbL1kI0Bv7hWsD8rBfEMXJSFnOLTJIVL
	G8YB9tI8FDFUOqp1pY8Zu1X7lxj561UApUjwZfTLmze4dc87iY//fwiTRzGIMUIc
	CePSJAdZsOnk7BOxYVSpO7Bw/JYdW9Fy35j9bNhpzvztsTrI1yimCDicPhmKRSsw
	SqvX8uYvaTIE+MUcOvxziSIUrpM7Fm7CrSFtE05mNuNDj0ALNaP/tgE0c7QVznrf
	Y/BuFXkQcZH2VteLN6JGkSb3Pv3qtFE0GkEtijOiKq8isaGXSDZBD/oWZlmcBsmZ
	4tIIRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w3e9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 10:43:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1683779a91.0
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345803; x=1788950603; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sF1N73AUgFMEsW3Z0Jj1FP1jxQJauSxNOYM2tnE84rU=;
        b=Rz/S1L1Cmp8bDp8xfvdn57yWrMUrIvtG1Wy0FHCeOnlVxVu85glkiKuLQeSXL8C8S9
         sw5P62c+aOLMgl+/r+YBKXvO+2wSsS3L0ozyNMpisbndNduWIa2pS2sMcKAa8OBN8H9V
         Y4jlORNfkt1z5THW//G9wZRXD35piuC5mCp4e9WspU7xiFrOC6Su9axYpBlIibVQcs+S
         OkXhHGqlqSwgNiyAP+fN0UhjLWRPZqewP6QWiu2Xz61SyYjKF8vhKer1uamMESIMfUbL
         nVrWNBZi28ZyLIqkpPgswdU+s5TSltlGqhfT/l54U7mGbToEjKaCRPtJa5AriAT7pxW9
         oedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345803; x=1788950603;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sF1N73AUgFMEsW3Z0Jj1FP1jxQJauSxNOYM2tnE84rU=;
        b=S5/pHXOcLCCToB66PGaZSHQeCif6Uoy+ZLUTZkr1X70U883XwU9Lp/2G+9sdzvloR1
         Wx+Qvb4d/NqIlSzwoYaytcv3b1KPBqPMvxyBc6TXbuFTnkMgsphvoHAZ6gBj9vx+uk96
         irOi1QZcb0OSNwWt7ctku+5UL4Geec6tGVrjyQ6c030WFNRz482by/kpTCZo8jc1rY8X
         C9uXPaXcRo234wVuR/2RHv82IuS7RRJlcZWUOhW3eSzdlwIXJeQ81N2Dz89VWirVD78H
         bOroIrYSemSWm1AOUWtYZynKEe//ZelXQhNY6Eri2uh/UuhX5t9jNKaIVCXFkM8L4JQO
         817w==
X-Forwarded-Encrypted: i=1; AKwUvBykrTQkwpvfm0TkJOLcz6g0vNGk6sP6PUcQtH6PGLvSYQKgyhf5vL2etyEgY+8Y4EUAw5nojrI=@lists.infradead.org
X-Gm-Message-State: AFuF++mPxfpIgqzKu1I2PrCEZgCn77NNwOkVpJ8Tg4SRqlHxaZ+4QzU4
	GLYkNZZrsuuWOlfBN55VOtfiEYxXoOafsEaYm4DwjNlPDRR28251Vxh875oQtX3qpzmjV5izLgB
	fYEgv3yaLKYvC+shkU3a/NIaqF2Y3VPVwyibv1477luC3qENMvFr6yPY/RPqA+5G9
X-Gm-Gg: AYBFou3cx5iO8IL4hHBM6i3G4XXLlXa4xDNdTmzmm1mG0tnTXJCG7X8ts10KGZjjYRO
	rcpp0psxSbNBg0D5QnCInkrI5s4f3WocVQz3Tl519EOXLCXFCrz2U8RslEpg/c5SvbikFAFgCyu
	Z/k2xtz93JQ5dNi0T3DztyV0vzgGV39QEpVskjYc0aD2q5xGqnjH/18gmZzMVhfrEYOBBmeEqFV
	Vw57/+ybby6E/IxuIWUfIJ3c9au2S2VscKoLoivvlEeiSyNhy4U+R6pgPeTS7UI4hkbRvqEXjgW
	ndF1hiUmcmGTRRcquBZOuA+75ZZ+YX/MOKng3IQza7iz56SJvOIMZrULT89T1B2zr0IFUskG2l4
	p/oEyH1C4GcV8zBC7mbWBv/p8g2IDTCxIKDac4pA6RXiqlvLbKq3xFiwgqko20TrEFKY8Z6w=
X-Received: by 2002:a17:90a:d604:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39aedf5e124mr6070974a91.2.1788345802670;
        Wed, 02 Sep 2026 03:43:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d604:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39aedf5e124mr6070916a91.2.1788345802161;
        Wed, 02 Sep 2026 03:43:22 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62cfe43sm1139160a91.1.2026.09.02.03.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:43:21 -0700 (PDT)
Message-ID: <99c5ff3e-c1e3-4565-9226-27bb1c5ef299@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:43:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: remove duplicated STA state
 from link peers
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260901085616.2959268-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D2OSCoQUmHQv3LhwseRnsCeC3KQRWRDK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfXw6VlVIPDeCSL
 Tq1SJNpWShlFY9nz2kwSelqK6S3rujru+SFn7Tc7L3Yyrjs+0TjJbIusEC/UKD1vBj2G1nUWhH2
 jmdjQepsJym42kLbRTrPVQEgAxt1Oxg=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97fdcb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZJRRAzY_uXNWia_j-uIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: D2OSCoQUmHQv3LhwseRnsCeC3KQRWRDK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX26DG/5qIxfJD
 zUz9uU6T8g2vSJv/9mD1CKG7YHKeTBJkoFoBlDreKL1G/whdn+ekrMTcrnQCP6s/w6J8JLweWl9
 AdRP2CrbT1nC/DNn0ROr5zmdAUT04oU2JZgqmVC4sr5ueXvdG8xC73gCctPPT9Em8iQSv0yCxus
 jajM3W1gVVmDJfgHYlGUU3IpbUh1NpdRB8LdfgV4yuUkrX4GUXBWJCH102qpPH8gqoccaLFlYdw
 yBt3sUFATEIZe2EB+WBqclzMSUe/dejYljtSJMliH5L/UgL9mL6wx3v71Y1WE0OBVEIWidea42D
 VERf9rOp6LtpJ2vgQjCSEH6+07MYf+CSXRo8ZMYVEIAHEHwm+/YSDaF7NrhilNtM6Imkw1AFeBo
 DKQCLazmpks5Jz9+I9EjUJDm/SlSXuzip3k+Qbsu1Q8IGcqeraB9gbkg5RYtmY/ngq62UT1eVNV
 DwaSGC0xbJpEyzoO+6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_034325_160259_7A74B1FD 
X-CRM114-Status: GOOD (  13.69  )
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



On 9/1/2026 4:56 PM, Aishwarya R wrote:
> ath12k_dp_link_peer currently carries state that is not inherently
> link-specific. Both the station pointer and authorization state are
> shared across the links belonging to the same logical peer or station,
> yet are stored separately in each link peer.
> 
> This series moves ownership of these fields to structures matching their
> actual scope:
> 
>   * Store the station pointer only in ath12k_dp_peer.
>   * Store authorization state only in ath12k_sta.
> 
> Doing so eliminates duplicated state, reduces bookkeeping required when
> the state changes, and makes the ownership model clearer.
> 
> Patch 1 removes the duplicate sta pointer from ath12k_dp_link_peer and
> updates users to retrieve it through ath12k_dp_peer.
> 
> Patch 2 moves is_authorized from ath12k_dp_link_peer to ath12k_sta and
> updates authorization handling accordingly.
> 
> Aishwarya R (2):
>   wifi: ath12k: store station pointer only in dp_peer
>   wifi: ath12k: move is_authorized flag to ath12k_sta
> 
>  drivers/net/wireless/ath/ath12k/core.h        |  2 +
>  drivers/net/wireless/ath/ath12k/dp_htt.c      |  2 +-
>  drivers/net/wireless/ath/ath12k/dp_peer.c     | 29 ------------
>  drivers/net/wireless/ath/ath12k/dp_peer.h     | 17 +++++--
>  drivers/net/wireless/ath/ath12k/dp_rx.c       |  2 +-
>  drivers/net/wireless/ath/ath12k/mac.c         | 47 ++++---------------
>  drivers/net/wireless/ath/ath12k/peer.c        |  2 -
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    |  2 +-
>  drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 15 +++---
>  drivers/net/wireless/ath/ath12k/wmi.c         |  2 +-
>  10 files changed, 36 insertions(+), 84 deletions(-)
> 
> base-commit: e07447e654476262558bee570f4cf456e2b32565

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

