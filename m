Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EE0CDE000
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 05:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEk9Abs3/XOpIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=; b=NrUaBKsALnKiHgyb4hORWkZ/3W
	u4pdc1kC8ivNEVWaIWHflFcnjHoIvxsEcKdzTGH32NFdesi7qpOPDp1OGRctkSrFSWIn7PKkJp00M
	aEzP5vW8VT40WxgtnDYOjCebZJYkFnNrUmB+vGc5uymc9g53VTzgkJoAn2Q9lI856Sx4NPxZzVanj
	GAs5CYQPAnzOkRzWfKwtxomO1RVH55xI7tFoH0qP5ahxxvPuOy7RXiVERD/OeBYjhKtj5GZSuKdL+
	ZI1deSCqjNrzqV9dLzNxQCPyL9X1bhkX4mFF5/pyvDOhGM8R+T7CeMYVFtzGuEhKv66mZz6w4koIn
	SYO5Hh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYt-00000007Bhq-1XRT;
	Wed, 24 Jun 2026 05:54:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGYp-00000007BeY-380v
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 05:54:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O2jZSw112938
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wEk9Abs3/XO
	pIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=; b=BjpvnqbGWUAGXt0VDNqnqpC7Ynu
	RRxMEIPLOP12HUbT32Hrt8dRc3g06YdICoIzqrnbUzHheA8hHrhLP4rweuWdTbd0
	kRQjlhXWBO+7qpLPJNoNAv3nxB9oExIffbWSryKHwC77UGLQRFDKWmToaaPSEFp0
	He6VrxbRVSy1MFG8VsFpYXwlSNR9iKUROtYCqLdDnEDdcvSbSxN1r/M3kVp5wYx7
	kXbYT17Yi2J4FrgRT5rurgLQ2txPeVv/9WaKfPAakcsUtPY9IPMUQ+XWuD+YZI4I
	UzlgBWcmF+aqs0Y+NDf3KTBUXHSzBvQcUKCWUaeZ7LHMFS0fESSnO/Ox6nA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r30hng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 05:54:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6afd85980so6217295ad.0
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 22:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782280445; x=1782885245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEk9Abs3/XOpIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=;
        b=Mv5ecvi6uJEHFtU1UXJb3Sfgq6cg0vZFWIdh55nWw3Gu+iVniYplHUcH0eGZZLAu7J
         krTgXDVaFjQU+Ry9/p1b32CLAdzY2x2sctzLgiKjvI2+pm6JkK8/TKE8LZrZXtQTFc6/
         nYIH705/lwQrM+uvXrOEfzYr5wuOCy1E3KJwas/whJoLmvrHd0fMyKlhs7r9/yjjdptX
         G+3OHE5BykcWIrIjUOtRobiVpPeRV9gdhs3T7NbxJ5+H+VROImJXtQyCPkT3x4S90mga
         demUo5nHoqBn6hY8TvuEkwhSphO7GZ9+HQuizkXbsUmAKAuHuTGsmnKKqz5zlIAYH0SQ
         4czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782280445; x=1782885245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEk9Abs3/XOpIYJhgdbBcRXlivAQuIKLBNXKIsmmw0c=;
        b=caHDCpaJmhlQS90bKmvitbRnQcGsWVQVy5vJQfDalMnaoCe7UWyWuWKPQS+SAh3G+Y
         vycMeONqthFYdpJWvw88ZK2ld/HrDCjiZ7vCBKdXp4cMZ7JiQ7osFjnl/XsNqtl9xKrH
         /+v1HfKhZNHYvnoa+EjcpnvD6SBFnev/nERJlpD5rQyFwkroQNFnTQH/Bj+0P5dW51MI
         5e7V5Omr7ol1AwiVIjTIuMVzUx7jhgbEMtP+y077BOcYcg8YGQlfVU5KTjZMk2ugFTqF
         d9Gj2kq42bj5rCea8ge2vM+C1iYV/nFpljociXQve+VpsjpKcMS44oSP5e/XlWs3YKV/
         UpgA==
X-Gm-Message-State: AOJu0YzXUiWHYLbN9b8aNLsc0IiSG8Qj8Hab3w+iNsbc4NU/OT2BRfAD
	x6d+6imP6qoKgW2GlUBNnWxhbM5sFk+2X8ptBxR04KKVClWD4r1XPgyJktUtH5CFVMSGL7fFFxw
	IseNZ92Fnxp/jlR1clOt5eDCkxbCXDOWmKSIBsN349sWQI9HtWaqjeoOgZRKeBe6zviKHwSI=
X-Gm-Gg: AfdE7ckgQRyvdJEwyj9k2U+IOt8XIpwSJ9B923PxtcWMNEwle+gkwUf9bfZRmjhx1uf
	E9b6e8UZUbldZAGIm+8cmPwdL3/YGYd+emzhWi08LNr18itv9sYnoW4AKqbUjtj40a8wuJruFxl
	Yva3XdS4VXs0Ji0zB6Lh2sFN4V8zV69D5idYz1IGtoxz34Zxm70v34g8pwo5nN9UIoYYVleZBqd
	oZrlOejgYJ1QwFJ3lFLtptppqPJXottAGxSu/TV5IIc8tr7R7PH1G+mRyjmnKaXwfHmsQNw3tEa
	F5O8avU4Q5U/abid/XqoEsrNvxRRynu1qZcf2THgOG9AtRUzWdXSmXaRvs55bS8+kfbeUD47MwL
	ZCwJl3Yx1o6x56kEykAfbRezO7HgoyX+5xm+ZDIq2/SH1430XYHyyQaQkN2zo/pbsagfOigrvg6
	L9skVdjEU4LBbIkBy9l3MpyEobPQZSHXLexYnw
X-Received: by 2002:a17:902:c401:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2c7e155d062mr20792725ad.34.1782280445483;
        Tue, 23 Jun 2026 22:54:05 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2c7e155d062mr20792575ad.34.1782280445051;
        Tue, 23 Jun 2026 22:54:05 -0700 (PDT)
Received: from hu-ssramya-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86aesm122593895ad.49.2026.06.23.22.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:54:04 -0700 (PDT)
From: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: wireless@vger.kernel.org, sreeramya.soratkal@oss.qualcomm.com
Subject: [PATCH ath-next 2/3] wifi: ath12k: Add timestamp to dp stats display
Date: Wed, 24 Jun 2026 11:23:56 +0530
Message-Id: <20260624055357.196596-3-sreeramya.soratkal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
References: <20260624055357.196596-1-sreeramya.soratkal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX3/P+2z3QyUoq
 f7plcOWulR7KztJFXaw1+YRtpZ+BofxXr0NokcRpvypRovhsxPWMjB2LMu0gLJl54K1AS9i+ORZ
 rI+fEjjoEb6vCHSb+MBHVLyiNq/veR5ZDCPUFzjQ7CpH0mK6WileZHOIFzzFBorpBuEySkftE8x
 P1em5LuDrhhHiMHrOH8woMMiG6nOqXOE7EcCmxt78ZxZotMEpBGAo4x5UzD/ULGidUFgeu9RkNW
 unyHPEVEz3bu+Ohc0cWH/B+03RfJVLWWC1IZpGrbxygLP+HILsqLceb0vEWvfNohA1apWPl+a2J
 COvU7CpZ340IAd1dzZgCcXMQkISiPIZeP27t75WlXwe3Pd1jZuY1xQlGM39w1Va1gPlN5eCu9Xk
 fkKJPiqJ8MQJeJO9VHax7VD2IhF6ew==
X-Proofpoint-ORIG-GUID: ZNe8mMqRaaaK84pyQGEp7s2H4iyGGOvS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA0NSBTYWx0ZWRfX37MVmC6wI89O
 mAxpm5W68k1N/oNWz/94C0F/RhQsQo4QDseFjb1HtEo69/SYlCdLCORwWT2W7hV1foWRXdRkVkd
 odiNvvSk9eHa/VWL75vApOktxzUN54g=
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3b70fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MF4ojy0fPj4DSkZxZrwA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZNe8mMqRaaaK84pyQGEp7s2H4iyGGOvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_01,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225407_799192_90784B72 
X-CRM114-Status: GOOD (  12.16  )
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

In MLO configurations the device_dp_stats debugfs file is read
separately for each ath12k device.  Without a timestamp it is impossible
to know whether two snapshots were taken at the same moment, making
counter comparisons across devices unreliable.

Prepend a ktime-based millisecond timestamp to the output header so the
reader can confirm when the snapshot was taken.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sreeramya Soratkal <sreeramya.soratkal@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index bab9d96d6acc..57c213111259 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1082,6 +1082,9 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	if (!buf)
 		return -ENOMEM;
 
+	len += scnprintf(buf + len, size - len,
+			 "DEVICE DP STATS (timestamp: %lldms):\n\n",
+			 ktime_to_ms(ktime_get()));
 	len += scnprintf(buf + len, size - len, "DEVICE RX STATS:\n\n");
 	len += scnprintf(buf + len, size - len, "err ring pkts: %u\n",
 			 device_stats->err_ring_pkts);
-- 
2.34.1


