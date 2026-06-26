Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9D7CDE008
	for <ath12k@archiver.kernel.org>; Fri, 26 Jun 2026 08:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e76UWCwc6Zty76f2ndkxP//JiVgpvXZpHBLILeMqOkU=; b=TKWtHWbbYJZ7JlOBHxsdM/QobG
	E5GIQhg3EBioT8H2PGrT4o3qeSGF5FO/HgzfwLMNz4EYtu9OLfuFvUoGaEojXPuu0LG/WRHasYERs
	/44iXzQobq990BmtKunYgj79duzXs1poDayULmGFVgKV1cPycMl5EW19M1SfFcqQpCZaeIg2B9c+3
	8S8Uk2r57wJhAqj6f5Jm9LGUndEn9EAdaYaoGUB0YqdzUoxAeUtyhjBvCZSlFhx/Y4Zl9uUkKalEf
	bOzQcp/HJzEj2i/K2Axm+fChp8JxHUMjL/l8FsIJ5xlpHPmbWZi5b5KZKOy6w5Iv6f+LXChy7SplG
	GVdc12Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J8-0000000Av2V-1mbU;
	Fri, 26 Jun 2026 08:53:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2J4-0000000Av13-1g5g
	for ath12k@lists.infradead.org;
	Fri, 26 Jun 2026 08:53:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VYaH587015
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e76UWCwc6Zt
	y76f2ndkxP//JiVgpvXZpHBLILeMqOkU=; b=PX68cSLv5Cby3pgZ1W7U+WMEgr1
	H66CEf1A9HBO9U8xDnKNb70C2hju/vgyrubNUeAgdKkyKt0mS1aCZj+YL1qH7uuB
	2S5aQ6SyRtFIpCthIjjEbvFXSNBFrpa8KNmuMCNyUtCnBByZuk0kwiIyc7ovaB1J
	N1c8JGRPrzC84gkyZCuLZ5mnPudlHBNpiWnM2ZD/+cUryCg0C/Mn30urIacLF9x4
	tPqlvyKfulVz7LtqHFbqTKZdp+pzs20L0dNwW2BW5oAv3RAd058k+8EjvzdFA2zX
	85r5NyqHdUn6q9IKgzbDMxKOqADJF0/TknnIVp4cLIel2LlTuM7NqDEJCyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eew9wee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 08:53:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0a27ad86so1436814eec.0
        for <ath12k@lists.infradead.org>; Fri, 26 Jun 2026 01:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782463980; x=1783068780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e76UWCwc6Zty76f2ndkxP//JiVgpvXZpHBLILeMqOkU=;
        b=WS03IXbu8PE58m+5r8n+S+wkOW5+K0MBmCEzwGcTN+6m7eC+YyaNzv/RZbDS2LHSgM
         IRF6hpPoYXkDJu2UQhy/gi5jEClWV1MXdpTRnxtFEixL9xxO10STnUadgDasWeuaBnvD
         MkNGdpADKiHPbvOg86pq2DbPzTk1xT6y0QeCTyXyGsBAAmb1poqswndc6mOsz1mlUpuB
         JVLAhPwOzwkyzQsBH4i7YikRupq5hsWtCHbu5J7u3WbNj1WsZRjrr5zWoMh6I4QX07Kr
         nyQfAK2bOKR2cQZWMwjUccSnNd6duvbT1p4Y6CQJ9es2AHY6cNdF2nTZKEEiVcNq9te3
         OGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782463980; x=1783068780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e76UWCwc6Zty76f2ndkxP//JiVgpvXZpHBLILeMqOkU=;
        b=RPkTVkIuEwU5hJ8dHUKMYth1I4qKpYPw+dmBVAuqQ2lJi3/0OgJWpk0o39iiGTMtQ+
         YqQdtEeHFz67igtfRB+XkYI+VFh+7HPaumtnhS8/IivXbSNxfK5VYeTU5bHMxl+3/WFH
         Mz36vlfSIvH1r7VrgdtdV5RwwLzsHpLAVTzoR+igFCk0iaVjRPkSA+5S4zxtazYqi15q
         hSuldhcPVhgO4dQTGhqgIZcT4JyDMU9iK9aCxCKy7JOGfoaPTpkDPwQicxlP2L/T8aay
         nApCJR9NpFcYX2y1J11wAQtNSy2/VUB8oFdwDygl5yfDBISoL+P0q/ZBIu/bGxxj8Duy
         BEhQ==
X-Gm-Message-State: AOJu0YxAJPnqb19ErCooUNewR9SWAcA/0tjNxx30Ek63xPUC1MBKb92a
	wB5IvDZIIBZW1jJHutKSXAI9MQu5AMHJAwQ63o5b+vjnt2eMfaFwZmbQrXlbtzKiUGIio+Zqbat
	5bKScrRKZ+p8WjQCdQsKKTLoKL7Fe0sPImtROF4vivYeKE3jeQIDqaaS5/RvUEP+R1wVMeNU=
X-Gm-Gg: AfdE7cnpMJosWPcd1obxCH5Ff8hWgq0lur98rhFE9RzlnYEKD7v4uce6pCh/xgApomC
	IJRPp/5uwtjHrT+IpzSzIxEc7iLnGyw82MSCC3UJZR00+tNAGvNEWd9yW9UEkIdn4Sr3aXqmRvO
	f9DIBCm/ZXzhCG0yuHv/CctyQuK9WquciJ4DG4PvC/yFvO4dsO/2D68rJ5CiEkiDJ6oHAGeJRK/
	IB66gi619Ceg0lesiuE3c2cYfDi/abTGVzdYZmS3ohAEgG/JcKekazrY/xV1r/3mUuVxZ5KpB1T
	El6f/5oteaynp+N0poBO5Z89pg2tS8bM3f1RFXHlyODmi4SJLRdCGu5h07jyq3dIClKRVEU0DIe
	AAqPFcl9wStnk9mA1pjd7bMJSWVICZnzRmeuzMo+KEtq7g+qGycmMswDOKsDdX8it+h+4xPfvoG
	4hl3NkNTI+kQ7pC/L0ZiX4c5ysISM5nyJd/TXN
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr5600233eec.6.1782463980454;
        Fri, 26 Jun 2026 01:53:00 -0700 (PDT)
X-Received: by 2002:a05:7300:2152:b0:30c:43fb:3a69 with SMTP id 5a478bee46e88-30c84d9b4eemr5600207eec.6.1782463979878;
        Fri, 26 Jun 2026 01:52:59 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca8b918sm17384044eec.28.2026.06.26.01.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:52:59 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next v2 1/3] wifi: ath12k: Use runtime device count in dp stats display
Date: Fri, 26 Jun 2026 14:22:51 +0530
Message-Id: <20260626085253.3927269-2-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260626085253.3927269-1-sreeramya.soratkal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX1Cjtn3knINI1
 MJC1Ia3r8uJMlYdfNjDeCrK3+NXLepDlUbFdmeED3qrstb09NOrDaWM/kvHW3mdOdlDAHGT6RSx
 KumM/HwTi36StbyWSZLCIMomdjIeSyU=
X-Proofpoint-GUID: LZCozF47XEfwwOVi44RB4z_hz8AJdNYa
X-Proofpoint-ORIG-GUID: LZCozF47XEfwwOVi44RB4z_hz8AJdNYa
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3e3ded cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=rbhcnOITtZTbLhSEK4kA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3MCBTYWx0ZWRfX2NHBtfawMOCz
 H6qRzfaxXjWBBnNX88jKcXy8jdziMtl8Jibn6j1cjZPqr1yDYHnKTEt6ck1yOVJxvVw1h6eMA3a
 uZYnc3wj5N1yIbzs5Y/wQ5j7CFBqR+RJcuPdcO2q8j5jqzrjgJOB75ZNm3Y7QarMN/aQiX8ZMOO
 adY1wYx/lyhfI8pSutr1xmtw824ACiTuhEais9c4NDTHPE+usJ4bKTqMe+suFl3xRT4murOAxcR
 0qsfQzCz2DD2MNjzkKVWEhhVMOuP+0sGMKwuFhS6Cg0tXBrIMV6uTHa7UsKuckSv3pCsmV33Kqj
 zHq3MrNe/UAWxcd+ypKnRaNBAcVzgOuLOc9puHFpb2S1oz/MZXgIHMXKEio+WBif2GkXHOhTFHc
 NX8Gk3AX9QqPtk5vjXEmMyVv5O9OaE4ov3Y7tRAjX7K68x+URI2JbgxTHhgPRF6de3mJ7YJeENf
 kZGxLPHBofXJE53DaJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_015302_573158_EA863856 
X-CRM114-Status: GOOD (  13.42  )
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

The REO Rx Received and Rx WBM REL SRC Errors display loops in
ath12k_debugfs_dump_device_dp_stats() iterate up to the compile-time
constant ATH12K_MAX_DEVICES.  This unconditionally prints zeros
in columns with no hardware behind it, making the output misleading.

Replace the compile-time bound with the runtime ab->ag->num_devices so
only live device slots appear in the output.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index d17d4a8f1cb7..bab9d96d6acc 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1173,7 +1173,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
 		len += scnprintf(buf + len, size - len, "Ring%d:", i + 1);
 
-		for (j = 0; j < ATH12K_MAX_DEVICES; j++) {
+		for (j = 0; j < ab->ag->num_devices; j++) {
 			len += scnprintf(buf + len, size - len,
 					"\t%d:%u", j,
 					 device_stats->reo_rx[i][j]);
@@ -1190,7 +1190,7 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	for (i = 0; i < HAL_WBM_REL_SRC_MODULE_MAX; i++) {
 		len += scnprintf(buf + len, size - len, "%s:", wbm_rel_src[i]);
 
-		for (j = 0; j < ATH12K_MAX_DEVICES; j++) {
+		for (j = 0; j < ab->ag->num_devices; j++) {
 			len += scnprintf(buf + len,
 					 size - len,
 					 "\t%d:%u", j,
-- 
2.34.1


