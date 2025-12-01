Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD130D116F1
	for <ath12k@archiver.kernel.org>; Mon,  1 Dec 2025 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=; b=ipAtjKAshwSQc3
	VPxI/JcYolHMc5aiaqLZSCDsfNoHKcPGQJID41LsQ8EfGZzcvRMChx7fdvGmhv/d33dAn8bCU6Jhx
	fKtsJKw1b74wM6QHSCD/M//mzBKdW16pibE9tjbq1Dx07rj3p0o2arj1VEEwODzRDUjqvjwbhvVmY
	TSBz8M1sVghyPCmrM685kENB4i1d7/W3oP3uliyhMfHp4RU0NAuyvHYd0lKu1uJRAxKfcWwG3zDps
	p/zeUTj2QO+w5kq9bXBr44ig7kGfCSuXvcjU92mYSyK65ivoi5SKEclfGouNW9c458XDLhIwg2FIr
	fbBxQdw3rrZYEr+fCq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fd-00000003Zre-1EUh;
	Mon, 01 Dec 2025 12:43:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3Fa-00000003ZqR-0BHP
	for ath12k@lists.infradead.org;
	Mon, 01 Dec 2025 12:43:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18OWvJ4062739
	for <ath12k@lists.infradead.org>; Mon, 1 Dec 2025 12:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OpaVvLRzwNyUQHnkwzspQd
	lBGKDEqFvfhusWSTkPKsI=; b=aIRYQvItIVN6H7Rm22Diks4D2bBagGteD4OY9M
	87t0BN05Tv8FwocgB6YkjPfCpa/WCGXBJkMpxNeBw+DAS/AHehA52463Q+zb2B+b
	nULQi+MiWKQsyjmb6jaFoYTyzVJ/KNUyZrjBkupvAwoyoNv+Cj7qzUyrfnO3VhAJ
	RnpDvsMNhyUNgniGK8tbR28JbeWpaWObLySCDgFAPsp26mSByJSnbuxDbXVJ1jl8
	YylXM8wkXvP/wM0BHaZlwXn+KY1Ytgi8ebTfJYQanaSOdjtsO1OImbkHT4hyAmd6
	xS78+yNi1iaZELj4eZBEl5bUaAmhkuE8RFo3i2x+Z8Ehc+Ag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7fwrqx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 12:43:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3438744f12fso10351636a91.2
        for <ath12k@lists.infradead.org>; Mon, 01 Dec 2025 04:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593008; x=1765197808; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=;
        b=J5TNcGsmP5j+4ikKn7U0CmNG7wvonW9s2jQiDHM6iI+XqCX5YDhrA2BBbmBqC+rT+c
         M1a0uWPR9mrm1MsuJ+pkSriRsWG0Rcvs8v3RLOv8Rntz685RGbOIrZ1Y+im5bzOWALoZ
         k5XfhPNtQIMdlosdIoDFPbTTVEe63xuvtrYd09XumEaoQY5idrutLariezNyb7BQWEqH
         rJ77OcOUN1/umzURSK5BKnECjOOY3TooNJLnVQk2VpwxntlbMYtRmuPm+4gvZoCIcL+l
         UpD6CUeDx9w4pJgipsduP8WulskhbmfWR43CMrOUzzmHHlkK/wtB9aOG45ZMGVUBOfKD
         sF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593008; x=1765197808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=;
        b=S+D3jiDLIMHUe2tCXnBsUTodoslEp4z7GMLweEdTy3glFZgRaU0p2dbehVTUAfMSAv
         JMpW36p4p4Xtkhdr3DTbZ6zqBpgCzoQWAlo4lTBvVh7A1TMVPbaqmHv8CwLc8+EVaYkI
         mr5tR8WBxtX57HTgpxp3VhPz0JiazZN5KDq7O7BfbcJK25sKgFb84UCMpvgCRsr+5xQF
         mYD38QHyKnbt3vI4ho2VvDYm6H5fhPnMQxPmk6MZq2r6k9a4cLOIx1F5EtKr2678444L
         UIoT7Riz51IMUcA5p55utHx09xFrxkGvr2/fMMkwtOYsTQ4XdDDlAqpPdI5qA0mv5Slt
         A9TA==
X-Forwarded-Encrypted: i=1; AJvYcCXr0e0N+66ICGIL4t/pN7jQci1wxChA1SNy1qEYe/WV4xlO/IXQyBk68W25UlTPSA8mWxr56kc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMZtq/98I1yTQ3wqHaVNWVxGEyynDsbgW08P7qrPF+KeAsTn6c
	N63pfrrU+qrXbVFJEPt8Sb7mShTECgUUzO4+YPOAEqRioS3on4eo7ZRVHz11/jWXJRSJR1e75BL
	pyRxzQoWk93VDzeJDY9Ms5PURv0dOs3qljy6l7KtZ0QvT8TANqkI1jxayqDVkgqnS
X-Gm-Gg: ASbGncsNuOAesr7Shp5raGxRvWihc3Ug8+vHpeM2y0W82gxlfo8zNoTLJhiE1ex9a0C
	HKdo/1X9kU7RmkalUNDi0APDzGJaBAvnYQkt0F0BHo/w4QbdGNuDggMKfReKHVAfVtL1XgQObaV
	nXiahu5INkQWt/Cm/O8hxeehnXDUy28QBCOcETNgPB8+mt3jYqJNJqrY9QfOvphwDOnaI/CxNHH
	aZ8FtvP8qm0gP40OMVmYMkyIvRxlpnXjiuG3YLbk4MpI2Qp/haiiIe8n87DoUZtSo/OeShD+fSU
	ajuKSy0CgJcDZ7wfQq44INj/WgCW60fidmCHNpPJ1vTciTlUsKssjLdIae9JC2A3I3IzEzPKpkU
	eJgzUbCdKx0ThPESiCeD4ppXBCq+jmtn7P6gRVZF2rQzU
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr23965825a91.0.1764593007426;
        Mon, 01 Dec 2025 04:43:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv8B/BJPSnkWjiTMb7xYIiTIMYZhhsAalx82O1NZpK1LC5SmZOTri+p5+kwNW6kRi3n2zqKA==
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr23965790a91.0.1764593006781;
        Mon, 01 Dec 2025 04:43:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:26 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/4] bus: mhi: Fix broken runtime PM design
Date: Mon, 01 Dec 2025 18:13:16 +0530
Message-Id: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSNLWkC/x3MQQqAIBBA0avIrBNSEKOrRITomLPQRCsC6e5Jy
 7f4v0HFQlhhZg0K3lTpSB1iYGCDSTtyct0gR6mEkBOPgbZypZMi5si9NuiUtFYpDb3JBT09/29
 Z3/cD48F2Gl8AAAA=
X-Change-ID: 20251128-mhi_runtimepm-f7aed52cc557
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=2451;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pcAmflXBLmmiVoJCOG8vI54ZlYxumcRH+gZ9quI/3uc=;
 b=slzoUkXd0LXre+U/uahaSU6CBfrkxDBvVi4QeGDQK13BAyAiueJULdaXVh7J25NweEqG9OK2p
 erBF5E42uRMAb3WmzCyUihVee/TDBYZ7B1BllpmT06WpiCHrcGUQ+TJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX0S9kSu7D8cKA
 siQSFgCt8fMYpwhHiq2ZaXHh2GYxp+0AzW3Kr9KgqtuTBWwGMbWSqg5jBbvpmfwvizuopqv/Iop
 7QkxOMuER8xntblrcVj3JTkA8AUv4jO6y/+86mF6vLx1DQb+vL1v2Z0qZWd8C5jEroGV/r+UEcM
 krV9nVdRpz1k0WmxKKODk20C0qiy/8TpZTBW/7EBPt2XWR6ZUhYKOC/kc1BfE5mIfa2tqMl0rPS
 dRAAGEeBidw/jl04aTlUW0LpEp/VEndSVHnyzTPiRoSsPo4F0GwVTWPtgKjmPI1MuRXoPsvfKJs
 k611SZ5LoH/HZNHHcqmC0g1M0ed+MZlx6LkpT9rJJxXx8rmTyJhDuTEgVodGQjzEtgeA7qJC9PM
 cxP95Hlf+kgGsX1UY8HFdXPJh8hoUQ==
X-Authority-Analysis: v=2.4 cv=TbabdBQh c=1 sm=1 tr=0 ts=692d8d70 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: DwVXq_IQMq8b5fsReAM2nOyv8pudhvrI
X-Proofpoint-GUID: DwVXq_IQMq8b5fsReAM2nOyv8pudhvrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_044330_193004_374A542E 
X-CRM114-Status: GOOD (  12.87  )
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

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

NOTE: As we have dependecies with other subsystems, Mani can you take
these series through MHI tree if other maintainers give a ack for this
series. To all the maintainers please ack to this series after reviewing
so that Mani can take this through MHI branch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (4):
      bus: mhi: Replace controller runtime_get/put callbacks with direct PM runtime APIs
      bus: mhi: Remove runtime PM callback ops from controller interface
      net: mhi_net: Implement runtime PM support
      bus: mhi: Fix broken runtime PM design

 drivers/accel/qaic/mhi_controller.c   | 11 -----------
 drivers/bus/mhi/host/init.c           |  1 -
 drivers/bus/mhi/host/internal.h       |  7 +++++--
 drivers/bus/mhi/host/main.c           | 23 ++++-------------------
 drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
 drivers/bus/mhi/host/pm.c             | 18 ++++++++----------
 drivers/net/mhi_net.c                 | 13 +++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
 include/linux/mhi.h                   |  4 ----
 10 files changed, 33 insertions(+), 89 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251128-mhi_runtimepm-f7aed52cc557

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


