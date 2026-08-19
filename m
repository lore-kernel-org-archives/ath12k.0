Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2E7C5DF6D
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXSdA/m9q8dapbmxpgAkVziFeg/cZYAgdhW6EdHL4W0=; b=pQPsjrJmQYVmJVs58QoppeLD7v
	EMwWYkkmdL7UGYHwLMBnJEARdtS0qPEMxhQAcZp1KGkpCn/56j23aZxjHI386UAlpb6IXO8TnfDgu
	4Bp9y1fm9gJlIjZqwXkMgCiBAQQNMTLrKdNR8Wel3BovOS9Qcpg5nJT0m78EV3FeXuM4Rq14m9glu
	kDFby4IIbJj9ZFxyCcT9999ZxfDOCmetjRtZGduXHfjllww00rl++sGp+wdTGbPqw6e+6xVvB74OP
	9GVLrVeJFjILTL62AnaoyTuDmvhGcLfAAnhZgL6Fw0JSgvfY5qLMpij6v3t8ebu4oMpQXx++DxbRS
	WvPasoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvV-0000000918A-1vu0;
	Wed, 19 Aug 2026 05:33:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvL-0000000914v-2fSV
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5IEis3498865
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JXSdA/m9q8d
	apbmxpgAkVziFeg/cZYAgdhW6EdHL4W0=; b=PbV0+2eJAngNfxZ1TWX3fEKAt9u
	iNXlP9pH0PSE7U27dZYHqRo9v8hMNt5Vz8dVRMtdr43tsZwNuFpbIwM/IytcHav8
	q+TEFbiVmeJerHFWEtZqmM0qKTGPWONSi7cGmfF5PGt+3xfIrxlvxA1tspMqXutJ
	JymLmHITFV+2x6QJY7P6eoFZsUrc7InQS0KedFxYaDjwh/IN70ieESC8P960DE64
	7CwFya/0UGO3R+ACedmaQ3ly1+c9NpEbhbo7ZPr/JYkigL83bf6mgRMJQuX75Vhk
	wx93yQPtK1lXTZK6R5yO11mHtm1e6rKoxE4zmP8Tx6L58sQwGMtGCrsVrWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftsgmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1197048a91.1
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117594; x=1787722394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXSdA/m9q8dapbmxpgAkVziFeg/cZYAgdhW6EdHL4W0=;
        b=B+SD1cWwmJ8CfA4wxNwc72NvnzO0N3jvfMVKJmKrNiHhx8DGhfRYx75OlKHutZqlUr
         dU6kGCTRif8I4GWYlqhpyPcXWpF9kgr2lfapmFgjdvLPCxlSff+s18YKtAVHG1zjzMh1
         L9ip/V/lyXHfhbSFxqSDbfE2QLQOSWXAvLtQuyHigxv5/oBfQ9/hkMD65M3V/Gd9Fy9+
         gvgGVCjByHHO76CWrVDbLB9Y0nibRQ/IShLt86MKhQ3JfCs0QpRGsbHBxB/eHM9YqW67
         j5ujF07NtYZq+6VZi4qTIcgjHrxmEhW4vFcEjlgXGK/O1CKVkXwy6eEp9h7yYwpOTpuf
         6cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117594; x=1787722394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXSdA/m9q8dapbmxpgAkVziFeg/cZYAgdhW6EdHL4W0=;
        b=Jiyq2L/NSc+hCvdJ2AbulQlbqPb9AR0XdrGQk4rihdTMl/1R5+eMe9mer3tihe03Hs
         soX5F5vTMaai2+kbLznwYclgZxCaiDfclV3A3VdwNF9L2cEXsCwpoxnGfIuk7AG5IZv8
         yMxuwKTxH2hRHGqDxtkRgAK8J/QO04hSxCjPm877osuaT7UBcCr02YAsRWC5XNllfWFJ
         T8muNYQaLO9sURzvpmxsyTX/iq2TtAJel7avaEvIsgykJIebOy5obEgCOrkSTc4j8stI
         HBCYf90N7R++ovMY8hoFGNxbnBFxjm8nvsIDwMhuB8Av/FLlEX7GgkepE+MpOlT0zYXk
         C6zg==
X-Gm-Message-State: AOJu0YyOzhD45cWvAGA1j0gfH9Yv92JAyCQ1jLq8mzgqW5DBLQGBwFFN
	O51xWKNrEK+6y25qkiHzWl4/HrUekLy9INRsQYygx4gAJd3dA00pjCVECBfQbXkqdCpaZk/2UAp
	d5VaCIXlVu00BPkb/hDwM3C0g0V+g7w6boNRf+6K6rbvs96EdadKe8imd2RyxGe5kptr8Kz/f
X-Gm-Gg: AR+sD10fEaDM6phl4SHkKMMGdkJPD8jRWBV8lrssbdRguuYWBWD8oOh0DGmZMVhFE8I
	dfvh1HWht0tMI3eCmpxr7l8EpAdh6fzyPYM5DlBbHVXK3CQnrw343zb4ZQYjjWoqbmmAYKmH/Ib
	Ex3Y6T7Krxl5sgMMq58mU30DYBbNp1iA5zwTebjeztV1ekkfjYgk4cewK34p8bFgLkCPhmyMT2+
	83RiQdMF6UZgoZl8ucbPMiHAxlLvqHeKPNN6v/9p9nmJjrAMJAj78cDyB51Yrdy1YSoexOIvClK
	VVI1E4gNmvuKbKG4lX9n4k7O+83E8SprgY9RMjVnr3ci0S0uZPDFE4NWxN1zLDuPh/4BJ8WJhGp
	4QpTyEKxGOisMNjDjrvwdd3DrNptdIF8Q8xUAUy/+frkFD2TSAxYw
X-Received: by 2002:a17:90b:384d:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-395810cda44mr4056759a91.15.1787117594241;
        Tue, 18 Aug 2026 22:33:14 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-395810cda44mr4056662a91.15.1787117593734;
        Tue, 18 Aug 2026 22:33:13 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:33:13 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 4/8] wifi: ath12k: add device DP stats reset support via debugfs
Date: Wed, 19 Aug 2026 11:02:43 +0530
Message-Id: <20260819053247.1420393-5-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a85401b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_Iy9b4Js2nCRBGGyCYcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX3nH0reaUFySv
 eIWUWUADN78S6PFnWHjHtbTEeR1c6YBpqhDwtpu6bb0jd0TkypSMYN1UiV3rGdm80kYYOMwzGfQ
 iP4ibfu7WPjWCH9yM+ABltoafaQFARg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfXzUHkJrUThuIQ
 syAbvGq1GmRkRq2AaBaCX2F7Nv4pc8id4Mvu30jtCxx8aC6n0ym5SnKXBJffDE7omasHEBDVxXK
 u8UdMwtDCX+wJ2IS35j+p3906BTWsTZOx2ZTK98AtQg+hKYdMZS9iLO6L/zQmb2kq+lFPL4ij0G
 xxwPLy+JZHhZk0PH51AStZ3oOPOFzMLvs1uKpW4ijL0d4WWGrRxpV/DgJT+7I8AVc7lnZhm56G3
 e//DYbUF6ZAdjIVy4jmLank3Hkz7iPlDaolZEoMhVVR/Wm9G9448K9Apyvej9Oz23tkJe/cBcZi
 N18y+vIAEfNAV9o55JaksnxRJtl/TRZlG0KJX/lQvT0ISiVhywYSx/B1vIHGjNBQKbvNb05xuk9
 6mJyhNEZsI4yZHymXTGWJwimO06z0+flIWSFapJmu9RYLj8RYrpCSeNOBL5b/U7qDwJXmXzaC5l
 SOY0hwKosypzX5h20qw==
X-Proofpoint-GUID: 4w77pJsWoc0UYI77rcXW6I1FeXCm3_QX
X-Proofpoint-ORIG-GUID: 4w77pJsWoc0UYI77rcXW6I1FeXCm3_QX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223315_873006_ED63FE50 
X-CRM114-Status: GOOD (  17.98  )
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

No lock is taken around the memset since the counters are updated
locklessly in the datapath; taking dp_lock would be misleading as it
does not protect device_stats updates.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 34 ++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index ec49692107a8..68acb4cb9c4f 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1220,8 +1220,40 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
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
+	return -EINVAL;
+}
+
 static const struct file_operations fops_device_dp_stats = {
 	.read = ath12k_debugfs_dump_device_dp_stats,
+	.write = ath12k_debugfs_write_device_dp_stats,
 	.open = simple_open,
 	.owner = THIS_MODULE,
 	.llseek = default_llseek,
@@ -1232,7 +1264,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
 
-	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
+	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
 			    &fops_device_dp_stats);
 }
 
-- 
2.34.1


