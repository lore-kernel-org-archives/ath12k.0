Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866F606A321
	for <ath12k@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDZrrmAu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DDjL8Z51;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsGQIwR3;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dp3wHSO1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=; b=iDZrrmAuydxyS8EMsw1iKfeWqD
	kMZJ2BoBKnXo8yA4fEqR4UWhl/njvnIsjf7kc1mZp6i2VOUosZ7hfSYvaSTa3yOCjyQvDJsXkKTUy
	4GcllzpZFdYx/oK8MsoFxCJoj3zAAz3xfVmJuYS9g55C33zIptY9kMaT7H1fgD8mFCaukEqxKh0Qv
	ozUQYlS3VuNtfmmUGKDcTnc19EyIN6+D8MRmRe3aJQ7OcNrjaOVwcRCTMj2uHIokwwOLqJM8eTAre
	mTkpiM+GPy6j8zVpNBM+woSlE2t9258NRzoaXYcY5QwV8B1nH8z22Ltc8u51EtI0ERRili1YzPtzD
	fvch40lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23u-00000008Ct8-0gvt;
	Wed, 25 Nov 2026 01:44:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23s-00000008Css-3J5e
	for ath12k@bombadil.infradead.org;
	Wed, 25 Nov 2026 01:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=; b=DDjL8Z51368M36XpmlXxyO+Lnx
	JrvdaDujOmqwfGBM8Uo8HGCZgEEdRFUG8R3hhwfaX4nqO0GfdSAC9WwGYiKOHa1EsnRrqrORF/uYg
	0GXAfEAfebvrtcQ4+ltUIxdcgEDKEMLc2zvPlZWzth7Du93RB9c833qlp0EjUj7RBULY9ondt1hCc
	6uIslLXvt60dEGHuFaolHzeFRXk//8zKXdw2i2IgctXAdDhmdG3TvQTwycuACttMxg6p/6oFHzjv3
	RoLLxR3+sBvh343nisGQF8ijLt2m1ONXAAh1QXOmfI0J40E62mexh+7VkxF6LKby4ra7U0qp7sbWY
	ic1mYUIA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23p-00000004jXY-0ecw
	for ath12k@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb2wI2288255
	for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 01:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kGQETZ/T+amttlTIZ7lR9e
	y6wrw1motDP5sTzBHtntc=; b=RsGQIwR3CT1orfEWTUB/372SK0QoRXrwXUFSfo
	bkhwEjvtB0Pgqfgct5ZHjme005gpYiE1CciGJN+JIs5R0OajOloJNb5XIm1l4bbv
	Py2/3M+NRvGt3QmNluz9HF78ElaSxJHVy6jtpsDRn9cj2nEb15sULUGvYPzxdXgW
	ZNlQVmMwWcrF+wHFeH/SL+Sv+4tHzetKU8fDeoOTJ0BDCFNfz1o69/g3vGQ82Pf8
	SBzY2fzF98pBwwYSwKqIT5xJN925gtOigYowx6Gf4if5Hlx9lkTMXHDQehz6OSH5
	ZGVRKbo+y959P0F/pMNgSB1WYVnwJZDCKdS06XF4tGJRbK1g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9sy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 01:44:31 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so7406828eec.1
        for <ath12k@lists.infradead.org>; Tue, 24 Nov 2026 17:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795571071; x=1796175871; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=;
        b=Dp3wHSO1Wu7DFqnNyvxdlzaE/P9DMUbqkvmSoQu0dy2aTfl7l3CI/ivORoKL8RO9xP
         Y+2v19HPZyqb8DG3TCncyX3EUJsroDuym+dv8EGWCHQf9/zDvXXn98AqFvDLKoci6bKb
         CWcpd17r16TLpqzSrDt3eGQyzM3YtpRmNtGbXss0yLbfFX3Nj0Ip9bmiD0FoqByYxUzD
         vqfGXgEAhiBIdUG1c/xDs0q+x8cHM0pu0cQkJBcYeufr2Akirp49+0MMhDQTGh9JY8a+
         E0AB5CNDFzKTECyqGOzx0IGzZYkZxeFubDaeOcfSrqmQ4LMe/Tih1MQ7FyfF/yROu4e1
         GcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571071; x=1796175871;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kGQETZ/T+amttlTIZ7lR9ey6wrw1motDP5sTzBHtntc=;
        b=ix9s8njKnHhLLrhtvnqrvMuePRNjALPJhfbOJw6DkjxmkYJMZ9CNeRJf1Fob101GBx
         uYc0jSH5TvH0uwYI4U64VBDQwVZNTA7aPeH3aEndJFpxOaIVp3tepx6OUYw6/jitg+P3
         nC8+qOD+SJjI9a65xJcXm5IpJCrTvb3yDRoVPr/HNkUZV2PoOa4tjcxdY2156d2Kmq29
         /Cy2BaWt0LwWmQFJQxvkAb5DrtdTwTehOOajv8YgIA+k8BHXjzLdRvBugd6rlk+rRn4P
         15kYF2R5qkZUHGn6wvuRwVvt8Lgf2SyifQCy/5VZnOTXIqvVxSxU+oYO3v6qw8lEC0/d
         3d6Q==
X-Forwarded-Encrypted: i=1; AL+hErFoTa9cX5BKl+pf0Xq1hKSA2Nh37sACvP8s3FZSYwEGP+LbW/0t5ZHJ7VVJQcM+XR9kvR2XVkQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/hOR4m5uy8gLvzZWUBynXCe11hhA+m3aI1+mTOd6cONNhEoLte
	0bJ8nhs40xRVErvN+ukA18JOgruT1Bvmcbk1pVGpRWK+7BLqi73F7W2x9eDw0/jP80GMO7PmhE3
	2Zy6lnb2JJM7gKR1dqa0sSseKzBWcDYSW6keoL5fDp9EZ5OiJ7F84zBjmyFRy9C3y
X-Gm-Gg: AZFdTZdRRfKIEvvZrqvXnA5bHpvPou964FDl5IZ5jvI3YfQ/081c4en4FLR5yWCcUCJ
	SnJcLTeQ6ZmVnjhTF74zuUBkc8Jggtr5vT1g1IZHuW4L3TyMijiXjJBV+85wigBiUJ+33PR66ea
	RP40MkYJOK3MCsIcTGwWIbFndAPoeSO9nGuxbYEeBn5hmN5yBbl0chOlJ5PfkCkFbsPvbccJWvB
	fFLGZhukPlXikprPIop+4VNfQDSD7Snknemf+ToClEvnyoJvmcJ9qWanZnwzxmi2xsQijT3Wclg
	i3kLdjYKW92RtReJcbp3vQsuTZB1Wat4VsMe5xylRelCmhb6kwbi6VOlXh7DTAGcuMNncWTg1wj
	lWSGddy8N74L3u7PH/l6ROMNNlcoavKg3ab2X1qa/8TSe9cKWKPcvPZGwMKdvAowWSJF23FdyNc
	FCEMN2/RgI7jtN2+JGDqVPkAZ5AAgQ
X-Received: by 2002:a05:701a:844e:10b0:1ae:4ead:8cef with SMTP id a92af1059eb24-1b55690e180mr15766350c88.30.1795571070737;
        Tue, 24 Nov 2026 17:44:30 -0800 (PST)
X-Received: by 2002:a05:701a:844e:10b0:1ae:4ead:8cef with SMTP id a92af1059eb24-1b55690e180mr15766323c88.30.1795571069933;
        Tue, 24 Nov 2026 17:44:29 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm30680237c88.11.2026.11.24.17.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:44:29 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:44:26 -0800
Subject: [PATCH ath-next] wifi: ath12k: Use bare functions for
 ath12k_hw_params::wmi_init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ath12k-wmi_init_param-v1-1-56f9142cc262@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHk9BmsC/4WOUQ6CMBBEr0L225IWsKhf3sMQUukiq1KwLYgh3
 N2CB3A/JpnsvpmdwaEldHCKZrA4kqPOBCN2EVSNMjdkpIOHhCdShGHKNyJ5sHdLJRnyZa+sapn
 kfI8yy/JjWkNge4s1TVvuBQLCDE4eit/GDdc7Vn6NXW8bcr6zn+2FUWzEn7ZRMMF4mquDRil0r
 c+dc/FrUM+qa9s4CBTLsnwBi3GVoN0AAAA=
X-Change-ID: 20261111-ath12k-wmi_init_param-6005e644793f
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAwNiBTYWx0ZWRfX22V1hAWqGKia
 HHU46zvXdSYnJQVMpCn2I3tOyOykzzQnFQmzwkzXOvv0JirUzUR3erEb2o2NLE5CpLZu8hEqlCx
 77VjyCwDyw7z9LNdWM/co/ChMyJ9CMIMabb6nIqajMXZWYvTyUOAXDEIB1xh2cg6hQTZVWCY7Zu
 hz3khnkgkhuG3kFyVF+6WMjHe0/gu3D/9Lvjc7S02ZrXT6DmIC+uZByn41B/itAU1dIJPhbVcuS
 osy68vxCqJl0M7qkaD9A1B0mH3s6PIFRk917h+hb44rLi3YZUVJSUYWin7pfyf5A9naeq1Ru1k4
 jqvIx194i5+2s1RJoZ7mOhAXTv0Xw97mBUCQEh0OedZzmHeRRTlRZKxn9ji8s0he0eO/lqtCTgx
 /GH8uij9q/yxnsfLN3jDtnWrMDT8tTK4lo8ruO1nDF45WUu18ippTxC435YfOgNVMcCoXmCsyop
 3f9YpkPb6AR+UJQr4Pw==
X-Proofpoint-GUID: hdZvQBn9-PtAxjAq4mCHZ2ecfuzP7t1m
X-Proofpoint-ORIG-GUID: hdZvQBn9-PtAxjAq4mCHZ2ecfuzP7t1m
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b063d80 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d04gWkbmapECy7QOw1EA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAwNiBTYWx0ZWRfX5S0ipjIGEqtF
 wA5KoAgiq0bumRHwd0shTOr6OLfCnSxQ9TdHXgVUZkJhW5HLsc+WqESOjsJmL4Hb0xMXDpW0Fpy
 Gk5L4ZQKDo5uwvv5Gk1DeznjgJ3sAe8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_014437_936119_1A57B458 
X-CRM114-Status: GOOD (  13.50  )
X-Spam-Score: -0.9 (/)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently there is an inconsistency among ath12k_hw_params::wmi_init
initializers, with some using bare function pointers and some using the &
operator. Normalize them to use bare function pointer syntax without the &
operator, consistent with other function pointer assignments in the array.

Compile tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
Issue flagged by Claude Haiku 4.5 during code review, and fixed by the same
model. Fix reviewed and validated by me.
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 48a2f6da16ef..16896118d2f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -743,7 +743,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.num_tcl_banks = 48,
 		.max_tx_ring = 4,
 
-		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
@@ -933,7 +933,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.mhi_config = NULL,
 
-		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
@@ -1023,7 +1023,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		.num_tcl_banks = 48,
 		.max_tx_ring = 4,
 		.mhi_config = NULL,
-		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 

---
base-commit: e2d74a4def28e220ad582d17c27e7597690e601e
change-id: 20261111-ath12k-wmi_init_param-6005e644793f


