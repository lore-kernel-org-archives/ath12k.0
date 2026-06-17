Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77A4CD98E4
	for <ath12k@archiver.kernel.org>; Wed, 17 Jun 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+zF4/NfEfqrlA2i8gwwLi1o1EMWt6+iNEVuGEzNSdBw=; b=aw/i5Am8P6g6IW
	8BTwBWURjFVTQWaOMdZvrrkgEY3PjIPCfbUFlnBLHeJqMShC+T9/ZUDhg0yeEiPBO2UVBfhMzPYHl
	bgShZJYK3vEheXoP0jnbxK1C6ZTD3JrL0kSrI8r+e2DDItnLKFhP0TGGNUld8Xn5IKESZ7S4L+BMq
	EvEndK/a/SZUH4ppDsbXBW6rmVMhO91cDfPU0h+mpvnMYkcvHNRPaJVlpcBg+5UQNWxvnx9KIQ3Ve
	3wkkuC9Vz7zkli6WWT7B7oDgxa8MCt7WYqTZUaguLTfaYc4XZxtq9fXzzN81m7Ud6Q1a4clCjdIng
	gqhDKqXuhvpzP9Zs1MHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmZh-0000000Gwwz-20jY;
	Wed, 17 Jun 2026 09:28:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmZe-0000000GwwK-1jB1
	for ath12k@lists.infradead.org;
	Wed, 17 Jun 2026 09:28:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UYls2217728
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 09:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+zF4/NfEfqrlA2i8gwwLi1
	o1EMWt6+iNEVuGEzNSdBw=; b=H7h/OGGIaTrNSZM4RFqaQdHj/HTijrlYJnOKwH
	ISXwsjjwLQgmr8jffk2y7+Be4qbazngFD6onZSZgHhLvek/V2DO1xyDVdeyS15tT
	nUJ2EFKJHlk8SFLl3FvsSTzWIgEukTGlNtqhuv8fh8yam7GZJSTdBQrAjPxuLHS7
	gvm0fL7JCjIhKuiTJmrccWYPVcLhKH/zb0SaXjns6iD2PUKzetHF2apjF3WFbb+O
	kI1fbPTnqnzAAID3ydgRBsmurr6S2tEcW2eNkUVjCWg622oeOOo0Gt2YhFawsulH
	Zf6TpnM3lHlYjWSJZNGCB6Bm7KrQsEpTxJ2FBNgVkKXfFF3Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeraffs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 09:28:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2b64850easo56441545ad.1
        for <ath12k@lists.infradead.org>; Wed, 17 Jun 2026 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781688520; x=1782293320; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zF4/NfEfqrlA2i8gwwLi1o1EMWt6+iNEVuGEzNSdBw=;
        b=iKdJlm54O5b96z9ngdS6l/VGjZAFA/BNXobPKeoGYWQ25fGkuYDQYlnkF78uahxW7G
         ME3D0QGJkbYoOu09VZckM7OzkFcMxp3mO31N7kkUjVI4G/DIrVqh6mn02JVAEPViPsQC
         034VT3L855FyG7yWcvV+bczIiknM+iGhSDe8AJ4ycHKdDFSgrSRITCZQqP24nvHhMg2Q
         KOr0YiM/NFZVGmtu9xVoZPqnR2ccOre3KWqb7WjUyB5dP+AU4nqu9p+Kw8yTLVNJMh9w
         4vRfn6a4GbyQnnR9+hx0KwJ1eYICFD8Yvm2CDbX9N2UqXZeFxyHOL49Um9VSrjR6twrH
         DCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688520; x=1782293320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zF4/NfEfqrlA2i8gwwLi1o1EMWt6+iNEVuGEzNSdBw=;
        b=Ov5gXkeh0XR75AEDvFn0zN77grxjoPq+r0pGY4CW8MKAV+I9dHL0QlveJmpIt/FpkN
         i0VeruCbLNQDucwQjw2Q+3y4djj94ravucVMTs5QmIA87UL8/FdCOsY8Ah5/j/zwJ/CS
         hpNYREMrDxVhzN+bBAHX5GbL6T/hvxG2S80kLj1WCwjwOJDPVRiXByLQ9V2YuUUNhVYY
         xWVhSatIaDFkjOSVdIZ6TJFFmiDD+zXq7sQLTr0DEiUyK/hd3V88MM1+ArU8ocZoF6CG
         MeVxmHiYMXVgPKPxgVzcAZvQQ9VZEY0pWQLobVsMCf54vXRul6Oxis0fgCsjVmFDj5V1
         cClQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4u/06v6ic/M3KUmFXKcmxZRNbpPE9r3wzr0o+v0kqgPjyx+nZotKYZEPiELnCBxsDuZP3qBE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzucqLe7rcFp5hcC2taasM8tKE0hsc64pjtbqt8ChqQHFIjTYf6
	HYahxp3ZewDVGcYZJBOjZonsyEZaKNb0bOkNEOcsDPBR+uLvug21P6AunfTpPkq5+6bd6BIT3dB
	hQXatMbrnVi7hmGXNuMvGDpfAU/SFBibuzWVLUctzPnNcCtipunest/+Io2HiZEqh
X-Gm-Gg: AfdE7cnXia9K77ucumqCgtIvTfafEP5+Qz10CGmWNSgQ6mpjQOvwRnjeQb8xAsT5q7/
	EwyofdAVrcpTZU35X2kzCwQ8NKymZxd+0xOjEOMYKk3dSepfz2SIL6i5RxioN8z2RDHh5lSSc5b
	O5SPu06q8q6qAU/e126zwhTbl0RTDyOcz/JkcWpYI9pOu06zxZVWpxSAFFCi284MvxfHJ5jVBER
	iEgyzRrz5aEOX0OqDrEqMDbi6iSUWyDs0ZNXieX5UTjVcmTKamvYKRRzYgMJod51Z3bRktdAOLN
	zS1IVDe8Wajtxjp0Y+plhk8e0mdcdYtpxuxkYGBTN8nXiywC0Kd6CjfCSkusD8aU4KuJte9q2S1
	rEbV/cYKCxAeYklINOuFjlfxxr7LJbq8BISwWHhp4jPd5OKu8qJRbPnWpINCATLOO
X-Received: by 2002:a17:903:1448:b0:2c2:5446:30e1 with SMTP id d9443c01a7336-2c6bc0c1033mr29709775ad.11.1781688519954;
        Wed, 17 Jun 2026 02:28:39 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2c2:5446:30e1 with SMTP id d9443c01a7336-2c6bc0c1033mr29709555ad.11.1781688519501;
        Wed, 17 Jun 2026 02:28:39 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm157080445ad.55.2026.06.17.02.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:28:38 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: fix peer delete race in MLO
 scenario
Date: Wed, 17 Jun 2026 17:28:18 +0800
Message-Id: <20260617-ath12k-mlo-peer-delete-race-v1-0-ab3c4f455dfb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJoMmoC/43RwW7DIAwG4FepOI8KOwRIT3uPaQcCZkFLkw6yq
 FOVdx/NKYcl2sWS9cufJfvBMqVImV1OD5ZojjmOQ2ng5cRcZ4cP4tGXnqFAJZRAbqcO8JNf+5H
 fiBL31NNEPFlHXMvgbTBGCNCsCLdEId5X/Y2VQT7QfWLvJelinsb0s66dYc3/tWEGLrgENJ4ab
 I3B1zHn89e37d14vZ5LWfkZt6Q8JrGQgVTl2so0DvbIakOCOCarQhptQbTey4b8Dim3JByT8kn
 WknyDtXWodsh6S9bHZP28pS/fqgK5xoUdUm1JdUyqQmphhAMTtLbtH+SyLL9aeqsOdgIAAA==
X-Change-ID: 20260602-ath12k-mlo-peer-delete-race-74fdaf880017
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXwWN52AgXqox7
 /d3gbynxzQq3Xgva7w6R9sRJ97M9QvIXnizi69kehEoQcRfZYS+Ros2Hw6zuoZrIInhQ4Yyxqbx
 sxeOC6LLpChK3SpPcLbEN+3QfOIu7K0=
X-Proofpoint-GUID: fPAsUN1ii7ldm7knkRXYGpAAxJ-8kVVz
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a3268c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jNANfB1xzCx-3b90aEEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4OSBTYWx0ZWRfXwFNLcdugtdSQ
 C6z/WiVjy6+YfwWzx9/SRHEiUm9TraamhAHSoALtKJjOZam3Kb+5u6O1P9eD0bj2Z5Ktn3ZzhoG
 ge78HZEhBgCNI+l/2aITL0OsbRi8e1uuBzXx0Q+n9yVL0EolK4r57LB9MfrTW2y/O+arZc7R1mg
 xl6GvWNx/6k+CCfXk8JvomW7VPto913UCCYuV/HwhyLITewhzXbROoALH3azUzw0nqL3RpJ+v0A
 JcHcGSzAhBm+/ATfNUHzWwL4Byys82dJgqJ6COL6A755T0UipHbkZQWW8gn+aEYZXieYuzh6Xou
 ESe0NZDZCUoN8S8Zar6RfpRHX/SwWz0bj1vhweAnQ0rgw7nO/+UqybBcurJXiOO4aDEebL6HV3X
 RcO1RzbYkd9lEIxOsIDxa6O9mXVdyEz6RQWiRh+LIyw08bwo6PMj0VF2T8XQ85NmNoqIWhTiYJh
 w8ciZMvF5lVP6vaRQPg==
X-Proofpoint-ORIG-GUID: fPAsUN1ii7ldm7knkRXYGpAAxJ-8kVVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_022842_596605_AB7A432A 
X-CRM114-Status: UNSURE (   7.82  )
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

Patch 1 fixes a pre-existing UAF in ath12k_mac_vdev_create()'s
err_peer_del rollback path.

Patch 2 fixes "Timeout in receiving peer delete response" on MLO
disconnect, caused by a per-radio shared completion that gets
clobbered between back-to-back WMI peer_delete sends.

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
Baochen Qiang (2):
      wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
      wifi: ath12k: fix MLO peer delete race

 drivers/net/wireless/ath/ath12k/core.c |   2 +-
 drivers/net/wireless/ath/ath12k/core.h |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c  |  20 +----
 drivers/net/wireless/ath/ath12k/peer.c | 130 ++++++++++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/peer.h |  19 ++++-
 drivers/net/wireless/ath/ath12k/wmi.c  |  16 ++--
 6 files changed, 138 insertions(+), 54 deletions(-)
---
base-commit: 4987a85fb0475defee458fa11af877c8e02f764a
change-id: 20260602-ath12k-mlo-peer-delete-race-74fdaf880017

Best regards,
-- 
Baochen Qiang <baochen.qiang@oss.qualcomm.com>


