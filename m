Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1180CDB479
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 05:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e76UWCwc6Zty76f2ndkxP//JiVgpvXZpHBLILeMqOkU=; b=vWcXDyXJF0n7a6YmgfLFSu2CkC
	ZxJ2mmd8Em+9wG7jjv3adI6tn6H8XHWAZJUIxv3tMSmVGaQ/iOYzI+KkW7fNwza+9lhKYAhrC7WsF
	hqDcNEEVHGnIFji9zSb0/WAHV3HUaD+ZN+X4jsA9lgjMBYU9m7grfHqJv2uvtVb8y/nOzNl8v7lzh
	Gt66phHLzSRrWYVqDoJlN/BMzevaWNxpLFYM4K94cktk1RJdu/QpejlL+oZYQ6sj2cCX7NIS/c3FS
	Z+i1ccDvGSJi4PpRbNaTiZE/u6rjIms9+ljWvzwJFbUs7Re3R7oyi8lYdVCGFEAwmVcD0CPgTFYfm
	NfowOLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYo-00000007Be7-2hwO;
	Wed, 24 Jun 2026 05:54:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYm-00000007BdE-2rMc
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 05:54:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O1Tao11307486
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e76UWCwc6Zt
	y76f2ndkxP//JiVgpvXZpHBLILeMqOkU=; b=N0vsLhZJIMZ7H153NnqisFtygqV
	ALcrGPsV+Sx5FJAcWN9CZFuGiniEHe38E71aJLTTPlGyn1Pmz1AxIQH4mRSru2n6
	D/IRUpc9gSWVPcORGqcJ25MD4Pz/WenCGnhdpfhSBY9clXDoa+3lLgmjeT7imLy8
	dODvkrNfLDOyCJwLfnz0sCegSI0EZ8EBW1Ot2j2HktEv9Ddz0tr4ahUm4P6PnY2l
	GQ+L9fwRhmyxzHdQNQDbNOOAk2jyJ7dxRlAdQqakl0onjWP77tuE3IZ9atVc0oOF
	LsDLNCIw6lZPcfCbwAfsc1qEDuoNfOwciTHNsepagNbOf6GHJvJTFO5JKYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3kjry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c725d3e886so10212865ad.0
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782280443; x=1782885243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e76UWCwc6Zty76f2ndkxP//JiVgpvXZpHBLILeMqOkU=;
        b=fg36G8qgwbPhwW3SP0DCEr0yBz4weXq6iTMuzpLhv61fHI/dn8vhz+XX3xLN/127GE
         B2DaA5LriG7gOaJ8TPTHXdV6a4rftXhI+0nudUBioK2/+MI0GogWmtiufzuHrjmt3Msp
         bR4QHq0xKyQ/lX4PKgKOTve5jplkS30WTWvCbi4zt821gAxQj7NOQvA3Dcg4aEs61m0k
         Han8vm/Vog02ML+HDHGsoI4n+qezp8sYDuJgBG+pE1vYUI6sNHbyAwvp4cSOFfoa7La9
         kVOGxKG4zueg/ICHrLUbh+mZazx4dd0UbK1o4STPbTfcfBtCMDZmcUMeoRi1fRf2Qjvg
         Oqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782280443; x=1782885243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e76UWCwc6Zty76f2ndkxP//JiVgpvXZpHBLILeMqOkU=;
        b=cqI35KulYYeUX/FRenSWLaUeUKVCd6hbLN3N1stHKZEkLKR4BPTBmIjk1qTfY0jc/B
         ibVypzv/jiJcGJdh0siMDpTQjxRVdT4gySc+z4oIGHoq8PraXkK2MRTBe7VM68UrTelS
         xuwKRNaOfr28V42s7R3/TwFXBQtH7zonkFqF6OKGP6of3yU1eNr6U6WjAa+Oa9Yjmglt
         8U/oC80fer02qtJkMhdEpw5dgHNQ/vgTyCQiPkQzBSAEi+LT+2uFHGjWqr2Qfo8p3OFX
         nWNhCSlF0pFt//x0TYMnPQWZQ3N1FOqQn/z6DgIFZVNkXBIn/JKPxw1vweQ2rOviCqBA
         kqKw==
X-Gm-Message-State: AOJu0YwKqcNMR6HRnOlWGUuplv/h6H0bI1da8lsyfzYge+GcquW6li66
	G+A8nYxmXBbsIVss63h7tElWG1KOlpv1aedbv3e8zI0WtpzMoIpRIMqvungf0E7fL9UZ80Gs840
	ztjxepE2BZYyweGCLXnj6H38PdFm65nqgNRxfk+eXRHlWmOSMoMKMS53ee4c9yfto5Wx8bFA=
X-Gm-Gg: AfdE7cnN+QtIZ52ImfoPcNaDA7xkKm0kFDPLxD3jCnDmgyaMto2K/jIwA6WRmzH8+Mw
	ROPcvULYVO0gPcTj6aYKj6Jwp1Yki6DVDOeE8pHUUXNB6SXbzLRAmSS3fAEt+qthPiB9McwuKVf
	zvH3lLo4/h1apVv0x1HNi/USjZU6CBxoqJHqBaZsn0eqSORGZDBDkuwQEAyNMupMbhLi0Ph9V+I
	i3E4QTuTgL+qHsbZWLSSpCWW4kRQYyOo8a2wWd7wbfBKI+10coQ823ZIRjqsJ5A8aFSQQqSEQX9
	GffbvjRsrxzGlcPIo8y0B7NPRiviC8JLE8P9FctBz0HMgzukp/ZDi1pBhB7R9v3NxHThxqEt9JT
	HInG1YjuOuAplqvpnm9+f7hr9/UhEipPM7u3QPhUOU5nhShFn1TPaKteV0a1sM6uu1Smnlq7I2G
	3D9yKEgvxp0SyDOYitIxSRvNOTqv2YjE9BUKWx
X-Received: by 2002:a17:903:2446:b0:2c7:dd6d:bf3b with SMTP id d9443c01a7336-2c7e16ff8b6mr20889555ad.37.1782280443477;
        Tue, 23 Jun 2026 22:54:03 -0700 (PDT)
X-Received: by 2002:a17:903:2446:b0:2c7:dd6d:bf3b with SMTP id d9443c01a7336-2c7e16ff8b6mr20889345ad.37.1782280443009;
        Tue, 23 Jun 2026 22:54:03 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86aesm122593895ad.49.2026.06.23.22.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:54:02 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next 1/3] wifi: ath12k: Use runtime device count in dp stats display
Date: Wed, 24 Jun 2026 11:23:55 +0530
Message-Id: <20260624055357.196596-2-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX3LkE9N/BZMin
 7r6T0EHP0IVUHwIPush21w0963Uy09lVEVhdFVj9yG5C/5667OztYd4bSpR4EaLmObYl799Yajt
 bElQAt58nl+kFxPlkBh+wdk9/yNIPcE=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3b70fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=rbhcnOITtZTbLhSEK4kA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Q-QEYZLD5_VDY_OnffOLIZRxOrXoW8D5
X-Proofpoint-GUID: Q-QEYZLD5_VDY_OnffOLIZRxOrXoW8D5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfXwavgi97y5kyb
 r+38UIS6pCuG5w+5ZCZk9fC0TBvoruK7XSkcKr5HNpHDBUwbee7otL6oEMEZvEOJG+hqpWHdmmu
 lvSDRtWZ++LFTRP9FD9LprDwpNJxLbpzMqejsIq/3fz7v4dw4B1Hk4PEuvcs/i0yBn8hHcpxfVI
 3SXdv877apm28JecOz7HJ+o2TVIpUTh5PG2tYeS2v1c/4LC/R15hV5Vp5TdeYMQMhF4IiQsDi0X
 atZ3hQ7RtaSFPKU/iOcTIOJdSpO4adau/0GtDuRDcU8vtiUErmgWQHCNdkZOkeuQfY/XJ4KrpWq
 M5bjqsQJSuFYJLov0SYZhU2yoxO0c0kKyab9ZpCfl/aMa41+o5Myozl3HJE8uCotUvNfOGGXiUX
 4WZFly8OvZTcZhFW97Qcjah0y2S0k924WLa2lvENi6ycprw1m3gr+pXfxOurehP6pCXrpazq7KF
 8mIBVgnGqUD5Yr4L7BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225404_743319_F79067B5 
X-CRM114-Status: GOOD (  13.22  )
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


