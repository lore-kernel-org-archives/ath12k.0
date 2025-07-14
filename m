Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B54AC83F1A
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLctuXiHSBcuYBm1XwBnz0H12VzIyMQ+L/Z0NIan27c=; b=PsmEbi505Uqt2Qdhhn5Y5I2zgF
	bT91x9Ld3Q2Ldfc8+MAAUVpr9sAJrDW6fmXXpGL/espotKhe6ok7Z+XYxHoRHV8a2yrOp/Zf0a/AN
	HCyPcAfjSJQ+QReZgAH7jP1LrfcnypjGChfwArzxo9ZPcVve3PwlP2KN27yeTG8wcC0f75dTil1Al
	VH23swKJyU60HtSYxeFtb3I+m/aUFJrByHYx+0dUbxYT17I0SwEap9EfTtJ8jbs9lIzg5DVStYjmX
	Px/0i8NkErFO0PgGnFn1CawcabUG6o1GwJ2ufZnFlFq/GebEFHcIWStID3/biBaMgA2auGl91ibrH
	1PwBYUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKnZ-00000002a29-2b6C;
	Mon, 14 Jul 2025 15:08:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKHB-00000002Uon-2gm3
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 14:35:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EBgIef003143
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 14:35:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLctuXiHSBcuYBm1XwBnz0H12VzIyMQ+L/Z0NIan27c=; b=M+bVfy5zH0j69J8P
	kb+WY9NvEx5KHa3YNLzkHFCDXiHv61PdArn4AUMn9sbsm6AQSFknt9lZd2LPiPHX
	Xy6cMbFllE8Q8V7ngi4DeEUhBEk6lY3IF5LG7rrAi9wmeiJ2PqvJPSSQC8DNI4Mz
	fuFulOPbKPvg7PGG9LkjxsEo05MlqoSND4oKGZRRRtHdTEkPzZN1R4oOyuZ3bsdD
	QDNTJlekMh+Nir0aGOofpVfX7g98m7XUfsQULRO+DQl4oaPtwEH5TCQoLnIH4A7v
	zmWg/cGvzIyfciNFns9NYhXJRutRIFK3Lsfeuth27pSUlH5zApS3CWyUJESF+tJg
	TsOGDw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0sgjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 14:35:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237f8d64263so44979225ad.1
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 07:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503715; x=1753108515;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLctuXiHSBcuYBm1XwBnz0H12VzIyMQ+L/Z0NIan27c=;
        b=JV7OxeMqGbtoKznUI30WVAgLgrZvb1WoGTbgKKDgeVfelsY143OKExxi86ywd8Obwq
         Md5TpNqiStu6kodVzfauSV7uhm/BcT371cZZJ4Oaag+OO3cnuSH8c1eOcJuoEdTS3HTb
         7fwbF0JMmKQFyaeKnwPRvgGIXg4tRPlVZiBNk5+T2aNPVApyejRu7ts0LVEK4SIVJYPz
         9bj9SkJ+d3XP6k5yoXVPysOXxMpBBtYqlSyn2U0kgV33BjVFN1MECtLBFVYYwv3PHgS6
         kkzSR3oiS7pCPTIukoYi3oBlzblgudMbK8uSdWWx1UGjBn5+VUGb6PjwT4NeIEUFJAVt
         IGJA==
X-Gm-Message-State: AOJu0Ywwgio6KKhFQcwOU3mEZ+uuy89KD9yBL2Hl/PZAIVqgs/Eeq1sG
	QNk0GdetB5I/oGTK4sQRFsjuko62h5kfa8xEtwZuxd6Wn3znv9txBvcqSmcy2HfBKXthC4f+cos
	12skt+tHQK3+2gqx8ozmXnP6+xO/YmmZKnQZ900bN8Hv4QViqb/cMhTFvi9msxP8VUQU3+P1q
X-Gm-Gg: ASbGncsgHP+cznZgzXEyTe2bOFCUfvV/d2iKuIEGxaxp2wD+c+Y3gI5O5ysYa7cFGgl
	BpXcgGcLa290+Eh+flrav44ke1NQZQcOTaTHfWhye8Dw9XaDNwn5wtXRcvB/ow3G7qqgWPQiVnt
	BtIJzKpUZbRqxZ7d0kkPSXIXIhfYvRhH4laJxoovU/7yeKXPnezVRJHcq2WYZ3OeCeWCmyAH6QD
	BGEV5Qa74VhdfsVhtw9ih7XTTMpL8cZAyVHn9WOoifRW4ucTrMrCG+9TbTYV00ZVhHfB20LtgkN
	nsD7SiQlCfqDSl+GXCl3iZczCFzlrjnWbTlNexSKcqoIXbI0gsT45ez93RkyNm1HVe7f84Xa2ZF
	l
X-Received: by 2002:a17:903:a8f:b0:223:7006:4db2 with SMTP id d9443c01a7336-23df08e5749mr158408175ad.31.1752503714753;
        Mon, 14 Jul 2025 07:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi5rD+uOGDiBjwM/aLthago/gBGI6moarVWfChK08r17vdvcrpihfhmsyUMHK8aZkVLWP7pg==
X-Received: by 2002:a17:903:a8f:b0:223:7006:4db2 with SMTP id d9443c01a7336-23df08e5749mr158407845ad.31.1752503714301;
        Mon, 14 Jul 2025 07:35:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4331900sm92953295ad.150.2025.07.14.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:35:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
References: <20250708181102.4111054-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/4] wifi: ath12k: Add low-memory profile
 support for QCN9274
Message-Id: <175250371354.2067518.12210451739869139013.b4-ty@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 07:35:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ZWgnYdIkEpOuZ1PFIpjFWzNCLYE-D1xJ
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=687515b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RSy2FYVPLGd-QfB_Y74A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZWgnYdIkEpOuZ1PFIpjFWzNCLYE-D1xJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA4NiBTYWx0ZWRfX9srjW2tBEgi9
 ZxX/vBDUWoI+09lEZcosq2HixoOe1OqRHFcYbJQGk13eep0u5x4xuM8Fh+IQ9a2UBHpQro5YqzB
 CsSin2xFT1JFkyCfbznl1bSO5LvpxLnwSmrFVyFKOV+xpxIG4cO2DRYQR7ulGOLmg1SJD6vQjLe
 //ZAyOhgKyGD3EB8uKGegswmaGqz8YweILzM2+9itQe3KdoLgIhvIYE7THQg8yr/3A5GPJK0Unr
 n5iBkm5ggOD9MhCs6peFKJQyLPc7rYjlJ1MhE3VAEciVftrAvbu+rF+ZAq2VBGkOykl7FQ1tD13
 N3yOPgss8CYQ8o09uRWia+a0YmOunZbVJ4qBaXBBbJEYuC4qKgBLkOcJEuMnpMfjwwztvoO67GK
 p7sfMiMWciOtHUIKXfozwXc/Bz72wmqb2gB3xwbcUrl024r5L4pE8jMwErCWTYfY1G8xk3QT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=782 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_073529_688307_CDBD83D9 
X-CRM114-Status: GOOD (  11.35  )
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


On Tue, 08 Jul 2025 23:40:58 +0530, Aaradhana Sahu wrote:
> The ath12k driver currently assumes availability of ample DDR memory
> and configures internal buffers and descriptors accordingly.
> 
> Introduce support for a low-memory profile to optimize memory usage in
> constrained environments. This mode is useful in scenarios where
> memory constraints are a concern.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: Add a table of parameters entries impacting memory consumption
      commit: defae535dd63b1eb78ba87d5b8c0b4fb5418fe0c
[2/4] wifi: ath12k: Remove redundant TID calculation for QCN9274
      commit: d11d81c46987720e022dd4008d4d1f1f63312e3e
[3/4] wifi: ath12k: Refactor macros to use memory profile-based values
      commit: 6397b92bbb00f7cda024056c8c8a10594a27ccaa
[4/4] wifi: ath12k: Enable memory profile selection for QCN9274
      commit: 545b669403d72cc4a1cf5d93b3fce0b6a85833f7

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


