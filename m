Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582AC56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=; b=OGi1zft07Eawt2BlxnF/Jdqh0p
	Y4sGqdUEDLf4PANyJuW/Oz9T8L3oB4zC9J8yt7RyCg4feLJ0Q7NsaZCpAYZoA0UdtAbBZoq496ewp
	BSqLh61byeJf+s7V9Zr9ocPreE//3kIzdB6+OdJYe9ULXJl++QBdltuqGYDDB7qI9qXdfDUo3xnGC
	ZXhz7q9TDrDwiFmRpLED0XE1hICtLUEbRJKLI+TqHwTBQ7zf77+KfMdlUxRmCr58wnYifF701NRTQ
	xwOQyW28AXgYLAo7A2/qbNlV1sIWC9UUEXtAxdM4PDtBboOlqIjgvfPvQqlX8q2rBNooU2TcyPFLS
	TNKMbrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5g-00000005sjk-01Sc;
	Thu, 06 Aug 2026 13:24:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry5d-00000005siS-0t8K
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 13:24:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfqk1277866
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 13:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WfGjm0JB1ke
	59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=; b=bqmSn918pIbcwrpARDOrGjjEf7t
	5ymkooCH+Jje6XgT1NToIMOvx0EDpXIdN/XmhYvce6kSZpR0UoLQd5VoIcUr5GFT
	wIyTECytMGUnseLIh/h9pzZXjWaadRKtcK7YeQBlLuioSJL5Ppib8PpfRkk3umYT
	J51DmxMbHJorB51ZIs86SnWhFbEI08mZliPAbp2inkqGfHpHmmSbaFywJeWogLOC
	4QgWVhHHU2beLauazruXjefA8vVTFXqJcW48grjQYM/FsF+zq6kLffO4dGQV0IQ8
	pjrhDa7ZyNt8icWAgf7ETEnBuaxWkgT1Y8ceazFgsG79vQGjjbJH5KlTSJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuejcvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 13:24:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso3744466b3a.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786022692; x=1786627492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=;
        b=YFENGxyljDIc4rfb9qagoAOXkIt9fOgBf52bZnTeEUNyhI+Ft2kb/cs71X8agMCfrp
         uIQXRzxmVSiIL3Y4QZEJgRJSniLx+ET2oX98eyWnFm/OVJX7yRJREWSfd1ymJbAZetJ/
         ELH+8Jm67FjMoOA3TfqTOVHf7dm2/2WXAXEKDUlp1YUGwizdhWtDtD6nNypaa2H7nUrH
         bc/fXuQROt2ymA4YUncW9hPPtyUzPPvDl3bEPq2CX3CL38tq8NziHapOSdpA5ytgySxm
         Wk4scJeX7xSHZIaKT9KIkbn/WLaQHNUh76dpXLCp0tNWxIjraBkq8AinZtTaLqegudxz
         aLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022692; x=1786627492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=;
        b=ChtE7v8caRncPmulmGo2KledpX4ynL9SvYkK/os3z5mJcpPw4cex2F9ZXmhPJeCjJN
         yfIdUqO/2I+LTO0xk0eJDowiAW5s+DldZkeaFjcgUOMbFGvavt6vQW94I4j5aJI8bjVJ
         cSsue0Ouv1ozvlYvX3IlpfZAiEvHto/zRPi61C7WE/NxyEz116bIsW9Bswgh/HLUcE3y
         PTHnUWWQozNvEMKahE7rgKznAmdtUCxM9H8UCD7WQ5bvSKnkWc3DmSCimu9bxsYn66Ao
         Fo3m8P3+vxZsAhuHGo/0wjSztSz/v1SkVb6uQgwmdsg6ibhFju3wZBfVcgMJZMQM2jhH
         qMXQ==
X-Gm-Message-State: AOJu0YxG7EO6F2c1/EWKj24ArRgKvyMiSfzpDnFTppDb1fv/kJp41ZFy
	VWSRqiDHBNo9TQwxYb4xM05uJq+Ap1NRurjIvBLWbSlTyumo4eqwRATlM/WgDF/7+UYq+l6Oi1X
	kCBtguj4ZCH3rvUQ3QvSlqp5hnLlXNanAmUvkMdy8DFfeDbiu1VgDdVBir048N6rwOn0qussg
X-Gm-Gg: AR+sD12MF3uixQXNPHinbhZHmpVWpz4oxWClHrkbEotIc2CbsEYxloFof4BPKWfh+wz
	CA1+b+q6kgfxM5Ufho72x5B3HqzW0h6bT+YOCclcP+qN2ZSuNqifSSsDMEgmDLrpfsvcJHO02kR
	3MEDZery9YN/8n3gwc4U6myBI6fRXNwuBPMWGmZyAdRFzsyo4S+mqcg9QCS1FmvVnY7a/2LuZ6A
	QOxjprvIKUC4pesioQjeIjJKp/Ne8505qP2ZojsNsx39pu0/u0hQFpyNl8TK3S0EINb8lNcA3TG
	qp8ZxYfSh0H1wWsN3O+ihY2M5cM0sLbUeMD0nVdu/XO6cVIen6pdymjqWErX5D/OZeCJeBMg21Q
	/64ZjAks1I+Dsh4/QztSvtBYIlNykS12SToqrnFpXIu50ZybYM5bk
X-Received: by 2002:a05:6a00:6c9f:b0:842:6004:3fda with SMTP id d2e1a72fcca58-84f2dff6433mr18414166b3a.25.1786022692152;
        Thu, 06 Aug 2026 06:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9f:b0:842:6004:3fda with SMTP id d2e1a72fcca58-84f2dff6433mr18414091b3a.25.1786022691577;
        Thu, 06 Aug 2026 06:24:51 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b785dsm1411637b3a.36.2026.08.06.06.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:24:51 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/8] wifi: ath12k: add device DP stats reset support via debugfs
Date: Thu,  6 Aug 2026 18:54:23 +0530
Message-Id: <20260806132427.3704828-5-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806132427.3704828-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a748b24 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_Iy9b4Js2nCRBGGyCYcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: XnxyaSO7zkWyapcPgksDTldxUw0bjB1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX4GmSKdMmYat9
 13J+WcldV0G9S2zm1jZhmUb616BhgBncHi5Lo7tKIf0unk/DD1mI6uh2c9ynvDLkxfa0g070kkW
 3JgCDozcxvrjGRCtgOsydR/3GUtOMSFPwNKEodCfHPDB7Bhey9nKFwzEo8N8iVJHHbG9Sab5Q9B
 xg+BW3yL/5kbXz7oTtqnOD+rChpr8H8fDEvbXYy0mu2v3UwfjKqQum9847HaAUZsFo4VaueKLEh
 yoj7L2ycB+y4zr1FHjEpl7p5/p8PuibeMLV7BQUblOMu1iz8X0tATBp0kTrvOEdgnZCExvkfN54
 S2kmm0WqZv5a2hmMOWdoz5LxWdU+6ia/VACjS9CDRR+GyhzWd1PWyixojRFLlplgRNuU24Z4cGa
 zxT3JVwyRzEUbtEUy+goRnQTfTLfnJTnNoR0rqYtuxdgFpZkfej4FXBleOD9o8sjLVv1GIHVIcP
 xR0fY7fgUEqy4kIZfnw==
X-Proofpoint-ORIG-GUID: XnxyaSO7zkWyapcPgksDTldxUw0bjB1L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEwNSBTYWx0ZWRfX60+hzYuoExqn
 N5ec1wa0e40vp7g44ZgmR+oX39fQyCAtrZfmLQerXHgKDig1eU3+4Nlr8hKwH9aRztfDyuxnASh
 ev5WjMOkNo3Jdo+WWoXjxEMS1BU3i5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062453_245760_F29736F0 
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


