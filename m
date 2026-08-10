Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F0FC5AE49
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WJ7sdDIIaWCbwHjnubOI53f7w9wnVfPNsX+qZmFdZ0=; b=j8yZbr1Gg7QFROj1znm7g2DkIK
	/zOoLc93dLGqh6dIf3QOltMuXIgXOujalD7Js4ybbZ+LWEmzTqNp7G5dqItDOnmhmfBvDdwrrL8rE
	+2q2JzUw6rW+3Lh/ewTS6Lp2EYOctIsS47Y0d5sOHdYzxcPUGWrSYkfMussfKwuqvHqci2AlvUjPT
	AkI5hE2kY5ftQKYGyBIMgPf4oaehDzwHJmLuuRiENWPVb2WmoLX5TBWDzwazI02D7NGZpmvsQ84LR
	Mm1/a8dhUxBlpfzV4qBxSN6EsfvgQGLm87hRadAcgFu1cYsONVS2jw2PBcFVRBojlwGLPn4BZC8GJ
	fJZK6HOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFT-0000000C3Km-222y;
	Mon, 10 Aug 2026 14:45:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRFQ-0000000C3Jt-2t4j
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 14:45:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj0WP1650302
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+WJ7sdDIIaW
	CbwHjnubOI53f7w9wnVfPNsX+qZmFdZ0=; b=cFWeLK6F+70UW+AnFDj486TCkA2
	kcwLH/zVC2L2mdwP1E7gixiKOdGt95RoszZDMlV5FbwmncBHGrX//g6kK4UwZkfx
	g1zXltNgq8GdsnpePvXdXiFGtWLFfrhuhJFUDj5EyZ4zMNMeuuX42RjAn+CxgyzD
	tOUTAhQvn3uFp3ZoUauXB8Lm0O6m479MrDX9ldzt8NJk5OatCvorTM4237Gu5ZDq
	MZC6XPXJWOgTFHlvZcaP1TVY3bGrw+hO01yVgWPPrGOF0Gvg1mGXbyxqvAwIc7bu
	iqiS6mDQ28scBFIUoz5iztELlYOW+s6Q0zv2qJGOFJanLIYCwXW7441RKuA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhj21v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 14:45:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so2291590a91.2
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373103; x=1786977903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WJ7sdDIIaWCbwHjnubOI53f7w9wnVfPNsX+qZmFdZ0=;
        b=Imbt3Rhs6GX7i2sVO3z+cBjV3+lHJFcn+sLhU1SVyyBxy0MUposziL5tmoCdrEhHHT
         4d7y2zneTW6mKqjTKfNzc9FZhxENZLL9dsDVsd/L7beQ9FU9sjqTI98HVqULhmp+9fsr
         n1EXPkwpeSBWkJxXR94N4ZoLi2X56nlxLt45rVVv6chqKXnWgAtkgP4PVOkmybnGFd3Q
         u+25xN1ikSZPlpU9Txig4EctHZAO6UkJESwkfdyksBJ90iI04I1TXPTqqvk+S/WdabeV
         yi4nMYJR0mVx0QpJH26qNrQD5+i4ypDkUdRBoQPDYtyOuH+Op+5Yuh4EP+aBDMi33Um/
         K4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373103; x=1786977903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+WJ7sdDIIaWCbwHjnubOI53f7w9wnVfPNsX+qZmFdZ0=;
        b=p1go253Rp9YCOiyhbmx3m4RI6fUNBskA5nSsud2kitXAib6GzsIehxCpyKoWAiP8uv
         ke3CA1Odux64vm2liyfoSZwxLiR4V3+YSNdOrDB4LFhHOn6JkPfcGO/5YlKJ++A58/rd
         P5cxJPFDn84PmlTmcBVeSqmROj2kUSDf29yWkSKoxtQbiX+RXz66xqOobnPyDyorAyt/
         C4qAaOn5kO3GH89MOYN1z/MlSoFfMXBNrRaokNMIgNliuUqWJ8PtIyRwiSwZFHpGx4fM
         du0nvd/m9ag42fcO3vekfP5c3BISyWDAGM4Riu4gO6y+klOeGI8Y0rEmRS/fZezOho8r
         IVug==
X-Gm-Message-State: AOJu0YzTJCdlSFkbXkJO3zStUlJHzsQWVHKP0s3286/MgGADovCD9hor
	qPvgwWjcIRAAu/19gGqStC8p7KLfpRUWs1gf4Epw1GRZ9NAfNBkS7NCgin7FnPWlMIkOqbv61Fx
	ZuXn3zOjhWB6DtCnJlNjv8bzA5VQBDbT7oFppashhQso4ZHYUi7PWbTfQu77CqsP4qFXwFwmw
X-Gm-Gg: AR+sD111mxXUr6xyP4dzP6HyL1RcG2fdrNhhB50ohh6NWvugo12hVpollF1JzVj7Bqv
	v9KFA4rWIpCxdUTK2k9JVUh8KXPqktLg8if509Ke0oNQHvXuAAwPnaZrBOlkMYca1YblnDNr/cI
	BTWNzDS0lvOcxjLz5unmaD3zmOfR+F5wsQSGpuZ7t2OvCDwwUwMtwB0u5ReL1M6Qf1PnIrojXhO
	3B2BlRo4uyRHNDgLvyKZJyLT37ldHdlgLdhQmP+rugFkb9PQQp1nfWDbsDeH0usGmMcZHthfIBU
	2oSt9+L0U8Rwb+azE9+Ei2UVw4dxfn1mJ6hY9WBZGOqd+/tboYDLOjEUmDxcDUd5e57pXLUj7Lp
	Q0mlE8XnXv5nzR3CRmaT/MZvDD4+wYeF+aOIxIfPj2PRugb/RS5Me
X-Received: by 2002:a17:90b:2684:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-392821f55abmr21702984a91.1.1786373102580;
        Mon, 10 Aug 2026 07:45:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2684:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-392821f55abmr21702935a91.1.1786373102128;
        Mon, 10 Aug 2026 07:45:02 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3926254ee45sm12797317a91.2.2026.08.10.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:45:01 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v3 4/8] wifi: ath12k: add device DP stats reset support via debugfs
Date: Mon, 10 Aug 2026 20:14:40 +0530
Message-Id: <20260810144444.2033607-5-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
References: <20260810144444.2033607-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79e3ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=_Iy9b4Js2nCRBGGyCYcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: f10oLeza4xbmT8cJCdYu1litaWbp3Dlu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfX5cXPkCUXp8oM
 WTRYbeq02mntBydx99X3ZHQa/F1xy1W2Dblr//gnt/7I0lXVFZY9E7P0EsFOOQWpSnepy9JE02T
 RxAVVASBLgQvmGjKY+rTfh+CDf2u373MhIc2G6qe9Bznm35/EvAjtXjwRKyRSt15ifoh/KxQKBU
 ZPI9/MjL95HVQlxYAHukBqembY3UF1h6nwp1/XQD76o9PIgDK4WcesqDNwMrjdW0qvV13gcVVbL
 oLhtm/wEdPHhtqOzjCdvMp7RgX0n2uZmMWGuxPtruspkSM8X3c4EAhcHpTKsrvGHyo8sUt17cl2
 Sg0di0lmjlnePrL+5n5eEsCzkMwznFYjDye4LqHbEQoQ96taQ3nvYa7jemQEJL5U7EbYXVQ4X7v
 8zbh01WJoQfo3gLoMvE28cvyhOET2vaHLbdSb19XkOeeCiblvRGW7U0ytAyn/Zv7XbQgy49lmtt
 HndW4bubfULuHn1bJag==
X-Proofpoint-GUID: f10oLeza4xbmT8cJCdYu1litaWbp3Dlu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyNiBTYWx0ZWRfXxwiA+elm4iww
 4YoOBkrl2jXmnW7wrVKMCOFCG/Yw2tcT/y2Tq1SDEyrAAsKmziMdEsarKCPQhnSQy1tyirjbV/5
 OVtI5JYsvd2iJvJ7TvkJxmtPLnhmtBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_074504_846551_2119613E 
X-CRM114-Status: GOOD (  16.93  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

There is no way to reset device DP stats counters without reloading
the driver, making it difficult to isolate issues to a specific time
window during debugging.

Add a write handler to the device_dp_stats debugfs file so that
writing 'reset' clears all device DP stats counters. Change the file
mode from 0400 to 0600 to allow write access. Use
simple_write_to_buffer() to correctly handle partial writes and
non-zero ppos, consistent with ath12k_write_simulate_fw_crash() in
the same file. Return -EINVAL on unrecognised input.

No lock is taken around the memset since the counters are updated
locklessly in the datapath; taking dp_lock would be misleading as it
does not protect device_stats updates.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 36 ++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index ec49692107a8..cbda754d8656 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1220,8 +1220,42 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	return ret;
 }
 
+static ssize_t
+ath12k_debugfs_write_device_dp_stats(struct file *file,
+				     const char __user *user_buf,
+				     size_t count, loff_t *ppos)
+{
+	struct ath12k_base *ab = file->private_data;
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
+	char buf[20] = {};
+	int ret;
+
+	/* filter partial writes and invalid commands */
+	if (*ppos != 0 || count >= sizeof(buf) || count == 0)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
+	if (ret < 0)
+		return ret;
+
+	/* drop the possible '\n' from the end */
+	if (buf[*ppos - 1] == '\n')
+		buf[*ppos - 1] = '\0';
+
+	if (!strcmp(buf, "reset")) {
+		memset(device_stats, 0, sizeof(*device_stats));
+		return count;
+	}
+
+	ath12k_warn(ab, "unsupported command: %s\n", buf);
+
+	return -EINVAL;
+}
+
 static const struct file_operations fops_device_dp_stats = {
 	.read = ath12k_debugfs_dump_device_dp_stats,
+	.write = ath12k_debugfs_write_device_dp_stats,
 	.open = simple_open,
 	.owner = THIS_MODULE,
 	.llseek = default_llseek,
@@ -1232,7 +1266,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
 
-	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
+	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
 			    &fops_device_dp_stats);
 }
 
-- 
2.34.1


