Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD2CAC5B9
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XCJKrrgmaDL66Q7yaaKc6X7YICUIwVtqPiefT9SBHIg=; b=OaGhreIN/xEtocf9VXJZqV1lzS
	x9TMcNWYiCzGFkr9asOdPu0jWnL5Oh7dsfmONaELRk4oxd9XWcnR5zPhR4pTvVRkpGoGUnbZLg5mJ
	O84IIgdR5ce0HFn9IwVy2M8sDPLcWWv6RaoZv8Ersn3BEoe+Yt8es7ZpELEJdm+o/eIzgdDm0XTZb
	XkII+9AFbYxq2KuJ2mb2P6f56IwmAUCuKWC0yQk2QiNGMutP8xKVn6AmNqhJMfMYU14FZ1CP7adjS
	v4yWQrw/Qkztfg5rDSKeZbwbnY7uK4kN6H9Ky8KK1M9mAGDvoIwjaq0yB9zJvo28vnE4b7Oi7Yz95
	XNhXYmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WTK-00000004ml5-0EZ6;
	Tue, 30 Sep 2025 09:16:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3WT9-00000004md8-1XCj
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 09:16:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HpfV024901
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XCJKrrgmaDL66Q7yaaKc6X7YICUIwVtqPie
	fT9SBHIg=; b=jw2M+syTYVCVPQnSi6UIBluidvi/Kd8ENqdlIx5pgBAPWjzseLW
	CFDwwowk9Fu3sBd1EO+phUritUosmv1iIgl9g4purH1vsICi3PkOn8G0sJXcUgBH
	NZsZj8jQBH2P3R5pD6lJCHOJTLIFtikCy26yYTIdS9d8PCQ+SrsS3OGYtY7uNVpi
	2KNvce7A6YiLaafupsoubf8OpqHeuhCFW5Cn8NInXya+yfhNow6i9IZskKV1hysl
	HIHxT7fQkof9whJTBV8vERq3C2Iag09bnbKUxWZpX4XaHdBhSByfuHiIUnduCtWn
	8GfHShtuOZi8V9e79flpknQb2B2IW8wrfCw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n0sqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 09:16:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77b73bddbdcso5142477b3a.1
        for <ath12k@lists.infradead.org>; Tue, 30 Sep 2025 02:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223780; x=1759828580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCJKrrgmaDL66Q7yaaKc6X7YICUIwVtqPiefT9SBHIg=;
        b=csLzgObrY0QWHk9wCtVH2ERW/8L6OcJTvkANWHIMqwNbNOSzIbH1UvlFKO6wGTrcbZ
         HDTLV1Pt6dpFHGkskT3fjz7Jo1p/nY3nHdLfSXDRxbbFS//xRQp+tsx8lmKcoiF+cIqn
         tYnOh6b5ZjOUt7dtME58XS91avl3Qcstlr0VFtRlXO04RTkACmCI+IrSZ4Bppg8mNotY
         RqngMQ4HMq/9qPfFNCiAZok5sv0lFm60YCa5fOar2J/OVEZvdsJZMpxX6C6VuLtL+jBk
         NIEvvye2jsPr5FuT4KDbiVpAL9NWrpvtfr0qAi4GZITq9fke5FUDsYlKqkpHUsNgy26V
         X/HQ==
X-Gm-Message-State: AOJu0YzjffEN93iS/PLqsnTdV81bc/q/j4Y+uBTK/1L3dlStnG1nZ2Xo
	PN+kxU2B0nOWzV0TJVaKWWi8L3fmsz16gK0X6obtIIoWGRBku+Q9o1tqNST7BZv+2KZRN2zDzFo
	vtlDZPUlgsd5g1HnRv91Ysdt737C9wV+cVdlq3kU1mwUA4Q/yCxXm5/hRSxRc2N64tL7a2MOy
X-Gm-Gg: ASbGncvL8EIYYj6Z+5Ino5dnmVweqNE227sxdjAGC/6kJXgEdccQxDLu51yTwxfY4KX
	JZqJio/8pL24ZJvOK2Q/HMeTruFoJdC2yhLYEfpc1soTveyfDFVKbmq1/wdEgNfoJxoom7JCGgK
	Nn0eqgaynPMb4zucQSeuRDqZGaZ3TUd8ixt4LUu6/Clw2G8LLzEReXNkQn2OjodlDAg+5QpCD+e
	+HRv5cjEw1K290hiAmq8KUBI3pWD9Zow4c2VsksbAb4jzdzYhg2jswvUUSIkmljTpvnp8KtKR5R
	zPsDuTlO4Q6DXuEGTLRQ/6gfXTQQ3g+shpibOaaGLzJue3/vm0UuiEXgQTSX3TjRdxTdt3WiEjc
	PR9RwIP20BSsHVMAImDokFcYoG1oH+vGrE4BRrV3bVRKBmjlVQvEuVf1kX2BvWAMG9C8=
X-Received: by 2002:a05:6a00:180e:b0:77e:d2f7:f307 with SMTP id d2e1a72fcca58-787c858295amr4518533b3a.9.1759223780160;
        Tue, 30 Sep 2025 02:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm7frcA2ooc4Zvu11tR6lQz0vE5C6XAaFdpafzAfJK1ikmPVz61Q+9J92XNHvj2SVqacz4ew==
X-Received: by 2002:a05:6a00:180e:b0:77e:d2f7:f307 with SMTP id d2e1a72fcca58-787c858295amr4518500b3a.9.1759223779703;
        Tue, 30 Sep 2025 02:16:19 -0700 (PDT)
Received: from hu-sarishar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b26644sm13431963b3a.67.2025.09.30.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:16:19 -0700 (PDT)
From: Sarika Sharma <sarika.sharma@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Improve RX Error Handling and Debug Visibility
Date: Tue, 30 Sep 2025 14:45:49 +0530
Message-Id: <20250930091551.3305312-1-sarika.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L4fuOsCrYzbvWPGcJ_NQOW-ZdfXntYqD
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68db9fe5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=DWEtr7Mots4MbkrcYGMA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: L4fuOsCrYzbvWPGcJ_NQOW-ZdfXntYqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX3nQ5D6JxRChb
 Q+s5eMKHjAZzWYMUODqvBgceC4eb5eOuqdAVewj2x6b4Bkpi+/YuUwwi3cyifzlzyPmhAfG6xRr
 ceWu1DP52YpxJePgMxz2KWZIHTnr8aXvZT+X0jDVUSkEo+wUxhJqTWr0lc4c97iS+5/1/54EMXm
 znoXeH+2Rl+Rq9U2wCnwJZHbaWOxM40rIn0QDFZIpWKFoHWk82QJ7TZXimpSFzTecT7ebzM5WEk
 NiOzoO/6LztMSlQ5INcha490IKJlfpaJUYlyuXzjgWHbRKGN4cZpsY7X+ioHXz2oSUd9nkQuwuR
 oVLe8VoYhimzC2t4vq4ykBq+d17w8OvB6cwjnMH0nO3pApS+Xe/iEo1Jzyb55n+KAUbgGQgsAqj
 KyF3f+H4DNA8phPXzjYv5/iQTPisvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_021623_599267_CF7035EF 
X-CRM114-Status: UNSURE (   9.00  )
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

Fix buffer leak and potential crash in RX error path. Drop MSDU
buffer-type packets received on the REO exception ring from
unassociated peers, as they are not parsed but their buffers are not
freed. Add debug counter reo_excep_msdu_buf_type in
ath12k_debugfs_dump_device_dp_stats() to track dropped packets
and aid debugging.

Sarika Sharma (2):
  wifi: ath12k: Fix MSDU buffer types handling in RX error path
  wifi: ath12k: track dropped MSDU buffer type packets in REO exception
    ring

 drivers/net/wireless/ath/ath12k/core.h    |  1 +
 drivers/net/wireless/ath/ath12k/debugfs.c |  5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c   | 72 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/hal_rx.c  | 10 +---
 4 files changed, 73 insertions(+), 15 deletions(-)


base-commit: 58a0a7a45feaf4538841afe8e251737bf7c56607
-- 
2.34.1


