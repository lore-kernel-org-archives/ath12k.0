Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A63CC021A6
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QHH8TkTsDqaxKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=; b=2pANP3OlgWNYI8i2Ys4R6PEpif
	4oAcK1M8MIctXnDaX3e6+BFtHjHs0RbucMBfPunoFtK/nPj4ahTrGWq0UyXT4yZ0tODLuoylUoTIH
	5zMfzF7VM82kGy4tmhC9vtlduX2HMV0VajaErGdU/sVdoU0yLoIFhbshwkPP5AJV/K2mYVtXx/+aQ
	Lzo7uSeG8DoK2Dy7Hz40dptkiaZkU+xc112xowbkDAGk7sYWLyEDzmMulmj2ORV2Y5r/aJK1AzOYu
	2oLcoXU2nEzCglra0QRuFWgrTWrJM4FY7kXzXUA3GVsbyHlR6yw2KbCOQCKExzmL85wcXM3clJhLd
	//cNNBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2p-0000000Crzc-1bgD
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 22:50:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2n-0000000Crxg-3X52
	for ath12k@bombadil.infradead.org;
	Thu, 13 Feb 2025 22:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7QHH8TkTsDqaxKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=; b=BekCuBkL2sjwY0ZR0hXBlyH7o5
	foZVko7ZZd+w4cxgsmQtQwJIIu/IiWX+9HJwkFuV3NRoRUhH+GY7DLV9b/eezcckaUodlDEteNjX4
	D8LM4XmBfWSVWDzawrvQpzMmUziHgBF1uXDAZk2Sa49Z2Mr/zfKWA6K6S2zVWG2iYepg3wgQZJtLk
	7mGj6Ap4dCRk4E8BkHwzBIigK8ONwpI+z55QbgjFWrznkl3VaJcAmjezFQ/kZ2uloXjF/zf4ogDoc
	nT9Qg+/JsAcMjAtLLnsTQkB5hMWbyDrjRAfxTOhzkB3V3RiJJ+yPAiRA+Z8nm1YCu/D1j8KafaLOJ
	oXeO9pmQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tii2k-000000018hK-0jhA
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 22:50:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DHRssT008041
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7QHH8TkTsDq
	axKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=; b=ZoRytg1hKUUrjGBSOJJAWrqq8+j
	VybpfTXJ/mg2fbIoWbrs0bywqw6PDcaOdZWAoFvP6laNt1dJLsfd6asoxW8vKg07
	6p36H+tRQCXjIGsBfsJDeKxTdfIkc76Gb31L8bj7oT6S/iUD3LHzKLeu30um77VF
	al56JRVZyKI+SBN2vMIWh2DNhmA5ghHchIQJ0j+C6WIr7t1BKgqRLvyfbLQqsGYR
	b8q7V6hUw3/cJexm2YDZDliGmUbhxPZsEuRc8tK1dYbhZ6fLzJP4dSej6G0Bl6eJ
	woNuohuX0fJsWRoyybPlLt3pq2sefB4MMz4+f+LKPlDVUG+63heNnHpEikg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1qwew8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 22:50:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f022fc6a3so29376795ad.1
        for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 14:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739487044; x=1740091844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QHH8TkTsDqaxKjXZMczZxcJjHOjjkHmCEvXQXVJNZI=;
        b=xJRaTzwNl4e6vLHtyLykjhRmws7/dZS/E99kTnv6kQFhBWILBsu8/XMZoVzBl5+mgt
         utb1+xveAY0k+wf7zKBqSxv/Z0PyTvqs5Fov1nT6l8T21WfIEhpH781Ku9BY3DnXXRdU
         l9/gLfy1dG8Xyx5kYUUfh0AsvA1uYI1/MqFnSCNgRgqqiVNdF1/J+hz+0nEjiaN4wrFr
         8FAKRexmaB2sbQ+8AUWIhcln613v9hRXUAJLCswim9ReJ0w18yI4O87TSu99Ix93Loa8
         yR707qi+bhGtmTpdcCvi9ieJnBT5Hqh+9trkxN7VQzP7UZw4c2G29paUKNnXA8muzwgJ
         zg7g==
X-Forwarded-Encrypted: i=1; AJvYcCUYRTOrpWP+Q2z8KThDeG4Jfi2RKoxAyjzjfVrUO3N2LGmJPnw9a9L4BNI0fGqf0IKS6kuiXXU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuIYUVkpYJiK4wY8eGyGYz4y0F/m+A4KYPYZ4Sm+hejYMEBt5+
	dmT+94/crFr6Fuinwfa9r1Zo13nO3+1ENNH+vYsmDmX806l0IGW243rkcSDrv9iOp6XGv0TOAci
	VUQexWYbHwoZxHZZDhrFoyR7hqzaluB/Em03RMiQghjyr3XyPfwjHp+YEVlTo
X-Gm-Gg: ASbGncu7xXAl5Z8r16buGdf3qQIYRNIRT2Jl9sDKN+MEs2o4Tvee5ww7PbWoIcorAqO
	00CNJPZEiEix9ZB1sn2Il7ZKByYoZV38A03ritwDBXAKcAzjciXVyAyts8NCuhfbawEVvRk/eF9
	XGj0KtPi5oxRR7nV30i9k38UnGbpsg9yIZCJsmF4YrDLWmykR8b/ugacNqYzz0tCec+g6OVuJYf
	tMERhlVyJfaGdLo9XTWHWIc6gWVnw/AePER3q/nV6shDiPvOLMiHZptSXTusLs6jOQA5vBrDLri
	G5GNMARdZI7dzpAuNu6/a4BKdrBkeax3YpdXifYf4mezbmTkc1uhAYMDLRGC
X-Received: by 2002:a17:903:19cd:b0:215:a808:61cf with SMTP id d9443c01a7336-220d376b0b4mr76445585ad.25.1739487044580;
        Thu, 13 Feb 2025 14:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKnPyFyt17H+NQBkHBzvQy8lsquibSIE7E5VrIS8ldflXSj55yntdLeifjiTlOlYf+cwECzg==
X-Received: by 2002:a17:903:19cd:b0:215:a808:61cf with SMTP id d9443c01a7336-220d376b0b4mr76445315ad.25.1739487044232;
        Thu, 13 Feb 2025 14:50:44 -0800 (PST)
Received: from alokad-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55916c7sm17571665ad.243.2025.02.13.14.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:50:43 -0800 (PST)
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
To: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
Cc: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Aloka Dixit <aloka.dixit@oss.qualcomm.com>
Subject: [PATCH v3 3/3] wifi: ath12k: use link ID for CSA finish
Date: Thu, 13 Feb 2025 14:50:36 -0800
Message-Id: <20250213225036.3118133-4-aloka.dixit@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
References: <20250213225036.3118133-1-aloka.dixit@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F_MPpf-dpmpmGJ4wUfg3a6Wzuj9kxHpc
X-Proofpoint-ORIG-GUID: F_MPpf-dpmpmGJ4wUfg3a6Wzuj9kxHpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_225050_911349_12BF1636 
X-CRM114-Status: GOOD (  12.94  )
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

From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

Send link ID instead of default 0 to finish channel switch operation.

Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>>
Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4dd6cdf84571..198e22ec6735 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6894,7 +6894,7 @@ ath12k_wmi_process_csa_switch_count_event(struct ath12k_base *ab,
 		}
 
 		if (arvif->is_up && conf->csa_active)
-			ieee80211_csa_finish(ahvif->vif, 0);
+			ieee80211_csa_finish(ahvif->vif, arvif->link_id);
 	}
 	rcu_read_unlock();
 }
-- 
2.34.1


