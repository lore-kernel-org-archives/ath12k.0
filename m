Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEECDC531FA
	for <ath12k@archiver.kernel.org>; Fri, 24 Jul 2026 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z2ZfzNUzZr0/QvK+IxoV2ajRXSGo7XNid0+pePDQW7g=; b=nD/dY9DGdfav6V
	RuDbDNmt8aEeKvi/4j9mrjD9/QtzxPi3Ns95SkHqzTjSC0+JI4PDDwTpgRXzI/TLLewQFSq59MZbr
	DJUwPQmaGcHVprzLKIcuWZsV3rdaUi3zRcMpufcgwGg8HTuWa1869BsQuwgaVCVX4vUTHZBKaTEnP
	R6I/RMhx5frmKVdOE/eF7FHRji4icV+sn1NYXOD69yPA3VKLwPqr7UCSQBT1GP56apZAWPccL0pOV
	YWQYlziGcisZCyc2X8od/lvl6aW1gKmpLVh1r7LwsHXhs62M7S/nESJrDqagwip+7O15TB0nGDa9x
	ozuxY+SXoI+UYWwnOltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIG7-0000000GleQ-0TZN;
	Fri, 24 Jul 2026 15:56:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIG1-0000000Gld8-3DwJ
	for ath12k@lists.infradead.org;
	Fri, 24 Jul 2026 15:56:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbKnw2710341
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2ZfzNUzZr0/QvK+IxoV2a
	jRXSGo7XNid0+pePDQW7g=; b=E+nh548w1aa9Yx6fOwBRX5CpC9nSStfE/ghM5V
	xjj+lnE0lzvozhgacQIP0PlxpcKxMCeVEw1ZAxYtscpcKWjTs6kd1EGm182DeQvV
	/osCHVW4fD4/jck7Er2mZEbeYGO7ZIATG/YCssnoypHmzSe+EIkzVzbshloNKnN7
	28h0fvjHQ7T7idNvtcN140AUU14ymWfngZ43NqpHqjGNsIOW/uawUi6uwc1C9aDp
	8rXiJSBUNqYA/gDa/MeHJiHQE7SdPJuLyxUg0XW8bLknDc+516VrZCc4GpGsML+j
	H0XwhhgmeW0zofx2dy/QgIf7+I97w1WqvRVyeVnT1B2rRAUQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggpj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 15:56:17 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9fdc2870fso251464a34.2
        for <ath12k@lists.infradead.org>; Fri, 24 Jul 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784908576; x=1785513376; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z2ZfzNUzZr0/QvK+IxoV2ajRXSGo7XNid0+pePDQW7g=;
        b=cMh2WrwNTk58H9FPu62otdIQuZSx/YqqepG+UMjY/QtYAki++PL0bpP95SJSicG2nu
         QmvhHuod6HTLKsIQMtUzGekkhM3e3DpJEH2HdyAXPmVgcDMuZFvx2pjWLCnvyDBZxHhM
         JLZ0FYfcg0oXZ81FZNdANm0dzjeOzJBNU9WQGHc6ZEn6aXokm242Em/ntAGwIyD7sjT4
         OMyroDi380lWZcPJi3pSx0va+nXEAEO07U/2pSoQbreMb2x3LsWZxRT2fRgSayEg2sQk
         DS0Snh9Xcc82KmNKJLENizfNQ5q9aaNy2gWvdbCcinJLc7GUUh3PfH4ZAO04AF8pCijq
         qVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908576; x=1785513376;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2ZfzNUzZr0/QvK+IxoV2ajRXSGo7XNid0+pePDQW7g=;
        b=jhl649zYwAOUynHkYrpiLvTxDwJYjidfSJ6UUrcHC6n8iORTHvUcg9Ht5UFW5rRmnX
         tuQY9SQJ6GEx6e7mXLQZ+6Kpyb9YiXvzl1wMdH3728Mj+A7FgUl3eXJoCf79R1kt7zPV
         MaQoKgg50FNx3L9wv33rv5g/SOfflJqWywORJTOxQvrpdMK0QjalYFbqUjQpg/hhCB3t
         p1lnqU5SIowwGY2KXDUAUvaqlhmfBLuoZdRWZmiU5vRb4dKcrkhN3NL6kWLv6v4dX0J4
         ywbnjsQ2I30Q/LKPFJ3EKytIWpPTQ3P7FSohVGR4S6GnXbtkgay33sSDx92W/bLNKHoa
         BbIw==
X-Forwarded-Encrypted: i=1; AHgh+RrHf05NgKx+ouzIA5zVDzFBZTbFUVw0kJJtyP5uSntLs7K1zCeCBTwOG2xSJ2MWUKkyDpoITCE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/8QkTBlsJGetHmWiCMvrt84AK0iuOpkf4SqwtEAXhFvuX6iP
	SpzMCws/ck6nxbDJimw+G95mejy0KLoqd623ffLS0MtrsP6PkKizro8TWWxJeDS7HoQQs+iYqps
	5BzNlPKmrxxWp4ie9Guwwei78dNulA0FAxBtHq1YWAJR7qd1y2CMjLHsutD3tY7OK
X-Gm-Gg: AR+sD10KWHlWtC9Vxene1XlY0iCgU6pYEXJKUEQlGEh1FUjjzpGPLPnkMBVimZWZMKA
	f7t49luz7xh0So8YE1t7GDNYlnMExG9SEd+xBL/qCyHXMpJ+bhttWnHkB3AH7XT6Vw9/holAM6x
	5ni9cbvXFz/2ANDoI4T2itYz69uOWkN9SPE0XbxEjVMLBHt10AeqfMFNlJ3bjLO/w4NAWLPadRC
	GmWxF94J36JXc+zyhiRDxSfGPjeY5cg9KyzL4qAjFT7LeNowiXajNBgcHmavCzCd6NqyEV153c+
	8IltLdlBzCRE1lDWns5z6aJWLCbrX7YsAsJfMGnR4i4EwLMP00mnEy4x2iy38VWNvBUvWjGpwPk
	7vNwR3gbg2Ecds5LkUpBw/Iropcqs5cG74neJc4CUv8Kk0dgHW15fIgo=
X-Received: by 2002:a05:6820:1f10:b0:6a3:8738:4106 with SMTP id 006d021491bc7-6aad3fc8f81mr4302781eaf.26.1784908576489;
        Fri, 24 Jul 2026 08:56:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1f10:b0:6a3:8738:4106 with SMTP id 006d021491bc7-6aad3fc8f81mr4302750eaf.26.1784908576002;
        Fri, 24 Jul 2026 08:56:16 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf9385b35sm134591eaf.7.2026.07.24.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:56:15 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath: Fix buffer overreads in CSA
 switch count event processing
Date: Fri, 24 Jul 2026 08:56:12 -0700
Message-Id: <20260724-ath12k_wmi_process_csa_switch_count_event-cleanup-v2-0-02a45d7246c0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAByLY2oC/6WPwW7DIBBEfyXiXCLALbg59T+iCOFlXaPG4LLYS
 RX530vcY3tqLiONRpo3c2OEOSCxw+7GMi6BQorVqKcdg8HFd+TBV8+UUFoYqbkrg1Qf9jIGO+U
 ESGSBnKVLKDBYSHMsFheMhcMZXZwnbvpOvsrOeOMbVnunjH24bswjq3U84rWwU02GQCXlr23MI
 rf8Ae4iueBeixaEca027i0R7T9nd4Y0jvsq9zU/ANX8FwBCYi9FB9o1vwH3V4t6+ImqoO7Z+bb
 HF1TY/gFa1/UbMHwiKM0BAAA=
X-Change-ID: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a638b21 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jy0UIgyy91Gj8lWLAW8A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: iVCj5aMQeKV7MrBVDrMLN0z27z_cQU_J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE0MyBTYWx0ZWRfXyL0njYN2N7YB
 u12dmPA+hFhu7ag0GxaL2sh5hp6/CDh3p1CWACU3X7xvmZ2um2BWkmGuVNXCZiOUvra1g/Np3jf
 zxhpPUM50wEyDcKvi7lbfR2JvHnJgps=
X-Proofpoint-GUID: iVCj5aMQeKV7MrBVDrMLN0z27z_cQU_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE0MyBTYWx0ZWRfX9OZCQUhcySSH
 LDxxifpcMamYbqhj7f2uVp0XZPP4O7rEQkAjZ9ADUinwhEk92ujyY4ubrUzi6SJnfTJOXFsmQjV
 YGAcbB4moU2H47WM7NKb7hvzclYTLm+lJ9xEVZsZdtknBkpMZQtLgly8hdsVdOl7/z533/GBbob
 jwv1LQLbJzy7YDsFBFnUUP499BngiyE4S6MMX12UjLWYzUqvc6EYm/a+hBO4d0JcfQpBYRmSD9k
 L443DueU+dhIfJQhZ/dAmSsYpXWgdQLshomGuQKLZ96MxI2JL9jajZcQpmz5Ewa/I3rtT5tlKFu
 o0z/te5Y03Eh5GojDscz2DSz/kcDuA42+nX7xbAPElRLy8enNbvZ1kDlp2mev40uIw+LuI+b3RO
 xY2xk/wt+32v41UcWvGVLR9TH2yjhe5URqTSBRJBdXev0ZKZ0s0nOyOznmPZb5BxGAYStGBn0BW
 qBQu0613EvqTE+MqKRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_085620_212294_C788763E 
X-CRM114-Status: UNSURE (   8.57  )
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

Both ath11k and ath12k fail to properly sanitize the CSA switch count
event.

---
Changes in v2:
- Add Fixes: tags to both patches
- Carry forward the Reviewed-by: tags
- Link to v1: https://patch.msgid.link/20260723-ath12k_wmi_process_csa_switch_count_event-cleanup-v1-0-c01ef10bc6a3@oss.qualcomm.com

---
Jeff Johnson (2):
      wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()

 drivers/net/wireless/ath/ath11k/wmi.c | 21 +++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.c | 16 ++++++++++++++++
 2 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: 0ceb105245b5e57f803bdc0e79dc077fc06ff384
change-id: 20260716-ath12k_wmi_process_csa_switch_count_event-cleanup-7fb191b7d7d3


