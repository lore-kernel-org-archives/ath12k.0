Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34020C531CF
	for <ath12k@archiver.kernel.org>; Thu, 23 Jul 2026 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTNHBzUnrq+R61lasDSevxcXJ4sgp8cMKYR3vV3n9bY=; b=Qjg5CtXS145/ZHVLhy/26WayUt
	xQS+zSPQGIwu1R9VyJN2a/qOvufM/5A5PydD81sBSjjJ3TEyGHMI8CI4ZM7R9v7Ycsb2fvAqmlhUx
	p4zheH8CivjeDlHwKdwdlF9AStPhPO/rp5nsFIbII8mYhgdN83W3FU3r71tDNVL7XqxB506OS3TUM
	gJOAMbbL0WeEhVbXry2KnaRgMI3dOL1N20EzB+uv7rLthW247tcZYM1HzBt9aURHS/3CVdD5BijGn
	JcoX6pyuM3rFCyCYRdLJITL5+IxNYGc8S1MBwq0iaHnWEVOSRv0wXXPXa+NnHdHy4r5yzgVXG97nc
	XHpz7XDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxI-0000000EHf1-3d4w;
	Thu, 23 Jul 2026 12:55:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxH-0000000EHdw-07pO
	for ath12k@lists.infradead.org;
	Thu, 23 Jul 2026 12:55:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qXJF3044796
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kTNHBzUnrq+
	R61lasDSevxcXJ4sgp8cMKYR3vV3n9bY=; b=Zf8JtmEkcdUpu5paH3LoG75nKmc
	FBGB8v1KomvT9jLjJMwyRToodQfOBTnU0xeA7FIPfXmiqJ8rwGLT8zsB3WkL544P
	KrZ/3mwG7dh8vVkpgLZxTd0tSb/ay4IchDIU50mymmyrdkTJjQ26DRBE2DZPKdWL
	tqRWsnfw9qGCCmVTxX/HWxk2TC5LRLhqGYYUYQxmy3uNlSs8MVc3ramEJwEsvN7W
	Sphcx6r768WsB0HbtObdtmBjtCC/FrX/sxibyJcqDJbRTZGhoiXEYKY9plvjlm9p
	JxjZOWyjJsopQAHpg+6Ui9fgKKGfP8kyJdp9Fpi3FAP22+IiMptxs9GecmA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq970r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 12:55:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbb61893fso15575375ad.0
        for <ath12k@lists.infradead.org>; Thu, 23 Jul 2026 05:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811314; x=1785416114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTNHBzUnrq+R61lasDSevxcXJ4sgp8cMKYR3vV3n9bY=;
        b=A6b0/U4pjjbIBPaKwt6zaMgE2c8PqpXX9IRGk6Khozlf67+276yTXzOfAxZ9Q+9zSd
         IqIgVFmK7zepfriRZgZ46zo6t/9oq9gfF4gWElia9LqL1vyCgCQ/hSjFfCXbgkEJei/c
         WjAmKYc5xs9dMz053C5CaIRsT38An9lCtijwHmkaSL0CnQVx5Os0PcgaiwZTS4SDX1fm
         k/5UDegMMmtUPVDjwq1CKBU03bbe+vEW66W+aR7GQmb2UPy1EBuxSvOYxPrL5Y0h5VIF
         QZmWYXKbSEiEGpK5usjatb2yub5jmTgAUJU3q+/oxxmuEWS62GC7dSfIhyj7SC1pgyWU
         Mvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811314; x=1785416114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kTNHBzUnrq+R61lasDSevxcXJ4sgp8cMKYR3vV3n9bY=;
        b=lxFQ/btC5cGxfCoo+fqp5ryfswKg+axDXgtfcfyblctDN9nMR2TVWTxcbCi/O+pWnF
         ZOto3K/r/PnQpC99tIWHaAcUU8LPXcvUI9dAXVQYhC21OAb75PRmnEdy5pDPmGjXZ859
         edcAWcOazO0UBvDWfFThPPc6oTK742i61376zbhJU0KuEUTj6erISJF54SRVl1sUqHCO
         bkjbQq4uk6QrrlNOi12ay+IofeOKHm8Qdl5FJ+9YXoZqe+U1GyyvuWkvJCqqKjeUI100
         4I7CZ51DOiirFZ8v4J3rrly1B5yotRwHT8ycpxRdXCS+1yKPe14FekU0MWTjdBbFHtkJ
         HDtw==
X-Gm-Message-State: AOJu0Yx/fCca4uxRcZMA+0z5wedceP+KoX/FsBbnEcPVE3eQyblmN6Oc
	MTaR7sATX1i+cTgiiFAa2Q0oq6StJ6pAuMohNHa2HXKeIetQExAcntuCmkVN1lwIMU7ZuXNYJEG
	QPyDLxf2d/xWTEbaeBTr9OUALZ3Z26F5/qGcSJOZfqGx9WC8Muv+noBYBHyt7cRm4ZE30Y9yr
X-Gm-Gg: AR+sD11H/JFS5/LlxGSF3Qb5Cazvr9jzjvXsXTmPWd0Q3Q+iFSLeiy11tvFdZzYtuRL
	sgIP4tEAvyRYssz9tjRQtF701IaRe9XiH0yOBlMuhdsMEDUtJ21mvNlHCc1w5jB3t41wwDbsE2o
	QEpWSyEDS6X1op0mkdmpn+ltX7cLOuhifkBjocceY0gWkidGjngx2dpzOn7/uinlYtoVRfWRSdq
	pHp+0bxwGTXVwqFs/DAuq4jZwSmqXeu4BmEDize9LwSRLRY4kAjDsgyE5pLfJXaUvgUEdGiqiH+
	jvM3IlWopVzKIeUJamzxMGJpZ/55Ja9NQwixa+R1r7m4gazkEhk3JWuDwuEmtsWjAOHolvorX1H
	6jC6wZOKaQFiap+Dz3PX+2X4lpjKT+aH0gWtdzFZAfNa6NYdpXevK
X-Received: by 2002:a17:902:f605:b0:2cc:864b:539 with SMTP id d9443c01a7336-2cfa6a4395amr34988805ad.6.1784811313797;
        Thu, 23 Jul 2026 05:55:13 -0700 (PDT)
X-Received: by 2002:a17:902:f605:b0:2cc:864b:539 with SMTP id d9443c01a7336-2cfa6a4395amr34988495ad.6.1784811313252;
        Thu, 23 Jul 2026 05:55:13 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f350475sm32998385ad.70.2026.07.23.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:55:12 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 4/8] wifi: ath12k: add device DP stats reset support via debugfs
Date: Thu, 23 Jul 2026 18:24:44 +0530
Message-Id: <20260723125448.922361-5-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfX21s2Jdfgd5c4
 I2nplT0IGg/0ny8shXo4wam/eD1N7LXSKELmr+EVp+qCfp/cNwauJlk8xaw3J2eggHDEc2f39i0
 BZbbtlg7M1BM4kKewUjg/u27+WOVxjg=
X-Proofpoint-ORIG-GUID: z54Yp26xr7H2ttf4GftXJIxugIW9Z-dn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNyBTYWx0ZWRfXz/DZVdapqoEM
 XGYwbYQPVer5hkQ9tsGcQIImdaO4ut+gA7t/l9NDUbMh9zFvZdUDOBo+O+DqsUucgh5oTDFP8U4
 EyHSo01Ws6y3O9LY2QFldM/GZP38ZZtFkZ2g+TjoBOTqxkwwOZa2aiMiIkWl8pyhsz6+VbJdxCZ
 Q1PLmigegmvqxS+SOpGS8D56D2uS0BrjNXbnnyFjQ/ZoevoaWGXvZSuEVny7JI/OUa0MSL3A7Rp
 dq7gqQk30s6ujncDpAKNFZTvS6/wNfsPtfH9CqkqCdPnm2dt7yhkqlvu8+elVqa3ZVsEnwjysQK
 JHYg4jGNgCliWo/NjaaQAFr/4++xOfjMa/XWdA5r2oXALIYh+xSk3NxpSdPTKxwaRyf319qnzyZ
 ocygvAl0XPr3LiMmCdbmoE/RBypYQCDkoVmXkwJ51hsYCbtQTJm8gYfjZEf2nLkI+ObyqPbC7D3
 BHYJd05OELrEu4K/zHA==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a620f32 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_Iy9b4Js2nCRBGGyCYcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: z54Yp26xr7H2ttf4GftXJIxugIW9Z-dn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055515_088366_5C040D47 
X-CRM114-Status: GOOD (  17.49  )
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
index 0f8b458200a8..e9eaa23ee63e 100644
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


