Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BECC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=; b=3NdsP4zyytzpKzGs7DKvbwcX0T
	oSownlAubC07PbLY3NGQF2yINgIKB1kBifAxczKwmpDUdssp75iMFvn1b2De2kTJzEwifTGTdzWeb
	Tmahr1GMEFz5z2crre7+WZ+qrd+Z1O9ycFx0p5MiDY+VcJvCzOIfOouY5UlIMdyMQXuZvLFUoto9B
	+iAFAj01L+n7ukkNCKRfCaPy6u01WfCLYrgp/k1YUCiOnnBJ9BGB0qkHUTRNZqdy1n/qQIfGh3CAH
	u92PGQRnZakndQU15+bwZF5R/q9ZQGGK58yYRCDvzY+rMUz+ah7Lq1mc7Xhb3a+U3DEd/HyO/QM+9
	4eywstEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0h-00000005VGb-1i2z;
	Thu, 06 Aug 2026 10:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv0e-00000005VE7-3pNa
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neDO1578756
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WfGjm0JB1ke
	59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=; b=TmLBIQ6Igeip0mPW3YDrjZcm/Kw
	8cj9dN01JPF8uRIBOv8Z/N0orgPeY6vbFYo7hzPxr+EZI0lQiisac1tLA/iWhNMp
	z/xAC81IYZuhu1GpDQyWbnkJxXN7s/vKpi0UwAhauY09hVoQNlWOcCwVxOgU8N6+
	1Y00PWYLf3zvgJFsrZg27oDApzL9UwBj3VeCtf4Po8Y+m+ID2CTItk0VTLoVnBZd
	5yuSUdsBUk50oOnK/ZvWAdK8u/GNdZgZf6IeQKx55Xgq2esknYLXNoMkng+7czuB
	/HdQDB70VU0e51QOrq9i3KLwZxw+f6dKiG/lGnQlUjvD4emwR448GezHtwg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hff7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso36560845ad.2
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010851; x=1786615651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=;
        b=Jk2rHF5Z2apRiyjA0muiVRaAlcqasTPZ9jabklqnvF5iHMoIlqVkT0+APPROkqNe16
         Op6slwA0Byrrgj0UR7QfmNKQXe7qAW88YXrGOhg3U6+q49psf3esKdBs+LSuk71yTG8W
         Z6lEeRN3OK//gG34FwRG6TyQtj1SO7p0Fm/oYFEH44RDitXH9MZWbGy+nZWp/0sR0cf6
         /eeMCh5lkbHnEMxPF7svc+xb73WB8jyNq+ExxG8m9AqMI5ADOwkYU1f/Q6YCExtmgTkK
         gdh1PyNMyTKUWp6GlaRUu4zYmZz/j2DI7Ucya9LUAlLieiMFCDxLXxhhebvnsXqebif2
         umMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010851; x=1786615651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=;
        b=pGdXhgllo0crHiSqeWmYSOTO4hcdr3mud94lrF7VzHI3gxcrQHoezJppZ2mhIwuq7o
         EXEID/Ki6MIr/ZiE7ZVDa02j/X3eCIeMC1ua1yvMxBpg0d2kRF7hvsiA8mrCdM/Qk70O
         WHz0jCo+WsGeIg7gQMbRvnKNTjV43gZYtc2X5+3gSsUWpH2lkZcyg8SznB5Om/kJ5Y9X
         EXym4M345MgGZR7uaYdolNSu/sO5bKqtKzc5FmrXWEFbSZKL68SFKYxi0bsUgAhhYglX
         BS76bW3Uksvn2nrRzQBK/1gwsyb4oIzOvL7nLV9U64HpLxi2nkNvtpCJH48i2HMm1HaW
         W5ng==
X-Gm-Message-State: AOJu0YzFo6vf/2lhx55a2pzr8bDUz+7nZ0Ffe+6XLHuBYuh2xzxNV38J
	4Xlf9I0rWSmPU2E/99EjwRYpvOFdbAxspcCsy8F/qSH64nnaJ9IFWpCUKCU8Jv06FErQ4a7j4tL
	s34+brIf8BLFawhCVRPl4k45nKO68fVpIF9/GVgCgwMfsRQy8RaXJik4r2sphaMnkjmPqsfGV
X-Gm-Gg: AR+sD10XhiJ/cTqS4JZBNwuz3u/MlVauyJIA5UFayP4PxdLcJFaR3IQg1wvnIH5hWb7
	w1frMjAJJXk0HQgNWWbmMIfzxBigdN67IxjYSa2afk8m2inGQBvhUvUptxOsfhRJObYQg7RhXGK
	U047MOJHplqdMB1D/tmmY2oZ5sGWspfIQ7LAtdM+vmynBclFJqcsdXqJk6scy74Wj/Yf49t6sh9
	oXIluQO39gV2f8P2zxcBGO013kA4DdM9YEqJTzf2250lQGAoP3yStwA44Epx7x3jou2nFJhG/5V
	AERJ0dZ1mGQiK+dtLAlBaOLBtH7rZIMlVIP6zqPBFgudQlQpgki08m3SaJtg577bm0FV+/SUWLb
	w7orEPiQU3u/oiC2rIg9r4WbMheqIaGdCeGdum1CqivGlcn700FMu
X-Received: by 2002:a17:903:287:b0:2ca:660:b1d with SMTP id d9443c01a7336-2d106da93b5mr1009075ad.11.1786010850664;
        Thu, 06 Aug 2026 03:07:30 -0700 (PDT)
X-Received: by 2002:a17:903:287:b0:2ca:660:b1d with SMTP id d9443c01a7336-2d106da93b5mr1008675ad.11.1786010850246;
        Thu, 06 Aug 2026 03:07:30 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:29 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 4/8] wifi: ath12k: add device DP stats reset support via debugfs
Date: Thu,  6 Aug 2026 15:36:58 +0530
Message-Id: <20260806100702.3479326-5-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2hVlJZ-HvfHzzt5UAXlFoft-F4Cq8L4b
X-Proofpoint-ORIG-GUID: 2hVlJZ-HvfHzzt5UAXlFoft-F4Cq8L4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX9eTK13QnwNsH
 IzMdbS57HvhzYhIcnkmyyznnYmdCwm4DQclUEEzF04tVVq5otPTMPO2asOnW/43yRpbxr5gLfSs
 o6blsjVnvuEXK9nAetADiO4UBItXG2Db1iCaDAfREq/tvxFkdirBZiTxg8H6ogq5dgDVHby+CWT
 E2272DDH70Gmo5b78Mu9sNL/fhxvdxCuOSsI3cqVFiB/0GX7xpJNgfxm71CfhnkgLr8sHEBmN5S
 J5KCPubTvEat3v/A8S5UDM7AnX+i1bwLfzY2x/nVXHzo9yuqKVtcdgEJaBND/9TqLsnj//VBrXL
 E7WCiAYXF/X/ZdI7VxnnuSLq5OiPAZkv4PL2llj7cu0cRkKzIIbOhHda4JxRmX/IT7Cfd0XCWjm
 qh/kEX//EcneTaUe6MvHcRxKB4CBDsQHQ+ms3lPuSrKhfaoFbD6MFgl6lepwXeFbPB0O0gIFoEh
 f8IMo3uRRyEPPM7sLRg==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a745ce3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_Iy9b4Js2nCRBGGyCYcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXwYfxRKXstmq1
 hYC4dk4filHzgYIvSDWeCQ7zfvUjbf6qwvwx47OsAcKur5VD2uvbpSc+oPCd8/qGyqibarx8ueo
 A6g31jAnT5Y5FiZFuUvBMHB1Qp6X5Zs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_030733_077889_1F04DBD1 
X-CRM114-Status: GOOD (  17.23  )
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
mode from 0400 to 0600 to allow write access. Use strcmp() with
newline stripping to match the input, consistent with the existing
pattern in debugfs.c. Return -EINVAL on unrecognised input.

No lock is taken around the memset since the counters are updated
locklessly in the datapath; taking dp_lock would be misleading as it
does not protect device_stats updates.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 35 ++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index ec49692107a8..0e446a666f4c 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1220,8 +1220,41 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
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
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	ret = copy_from_user(buf, user_buf, count);
+	if (ret)
+		return -EFAULT;
+
+	/* drop the possible '\n' from the end */
+	if (count > 0 && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
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
@@ -1232,7 +1265,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
 
-	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
+	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
 			    &fops_device_dp_stats);
 }
 
-- 
2.34.1


