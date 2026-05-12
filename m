Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40A7CD37BE
	for <ath12k@archiver.kernel.org>; Tue, 12 May 2026 04:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mHl7ymRRDRRCpw1X3DdWS0B92buiELgNhVr2GCgQ7XQ=; b=WZHLzOV0u7rTVPSL6erf4ArYHJ
	7zPRo1pfVy2QjuhuCEyRMMKhzjEexNWJlsDqFc9utO+0H1dLAnnuV059gxaz4u4Ga35UKVFQTxBWl
	jvPUlyHG0HGOq/wJoiylXe6hhkNXjOrCtucnwlOMpGe6JvQ/qQO9R6//in/FOQ8QUnqO70i3buvzt
	G98DrOdiFimCFFYR5bPA1W7hrGr2h26Ib/ntMePpGUK4u0tZ02RIqf7z6zv6nZf52r/gC+dfjKYc6
	bdohmjHygZ+ssNg2n5Z/ss584vlDmebQmPeEQkQ7FCXfkuW2GL5CGR2KnwQAzPTZUXHIu2A4PTYbH
	rytSQIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMf3X-0000000FVgt-1rkb;
	Tue, 12 May 2026 04:49:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMf3U-0000000FVgS-2t4g
	for ath12k@lists.infradead.org;
	Tue, 12 May 2026 04:49:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6foU2573884
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 04:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mHl7ymRRDRRCpw1X3DdWS0B92buiELgNhVr
	2GCgQ7XQ=; b=IuTmsgVLRTBuwG/NZ10a8ErPvEdLGXpR6gLAKm0Jjzj5W1cRUnG
	+EslD/mgibUyA/SQqUWkgQvCna7+zO+oxadMQ2DOt5qMoUKHesk+d8SEQe2KNhko
	rXrxo2G1CyL4jieuHCIYJf+GHHJvLIbTePZwSsVG40Do/uo6AFy3y2BXSa+qF9mh
	PGHuZaJNsmIr0Xg5yJD5Juy01w1IKIv4zlk5kQsiIiLiy8oldUu/opKp6X2xHy09
	4k9TkIVfcM2zLupt03SC5vOEj2LSmKbYW2/0ohUINLGB3EWbA9U6YtrtNX8Sibp8
	TDnmM60JVa6SjkFn1MMhz/rwMvRY4Tpt3ig==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29g95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 May 2026 04:49:15 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so8212399eec.0
        for <ath12k@lists.infradead.org>; Mon, 11 May 2026 21:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778561355; x=1779166155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHl7ymRRDRRCpw1X3DdWS0B92buiELgNhVr2GCgQ7XQ=;
        b=hKRjKKJKdGKuIt6nvDUZeB4IZZNzC40JP4Ep5Uo9N8LHjOZBIgsf8K8/L4hcfDzz/W
         emy+h50RFoHjMhb2T1ALwml1P9hxOgo0Coxi955R54RSYpOocokcuMFm/sUgjn6cPh+e
         9/2v1jVW9Wf6A2i2ZhkSdwCE7Hvcue/yMqaoAxjzF2/YuXkfVHz+kvvsL996OZti6X7u
         mdO0JrN4vtWfT+M5e3wRnyAv4LOdOf3V3eqPhByg5qDluTMDmkOPD/klKbP1jNkYusfF
         S8W6CG9/Dg8XLOYVj9DQz7BXgfEd1CUlYduzxfKhoezFR44pcGZ9oVNyGskZk35ztLIa
         9oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778561355; x=1779166155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHl7ymRRDRRCpw1X3DdWS0B92buiELgNhVr2GCgQ7XQ=;
        b=Dquor0xxOJ87jPhZtRE6YJp/gtVpZtkKMIYr9hrOet+RsGP/JRXofdGKOaGrHEcgPC
         sDuIOr2HLwRp2mKehK21JzeVAaJmmu9yMPoLcmeBPr8ltxotd3IQDiCKQTxKMNESRlzi
         JQjMyIJoMKhRay6PFDsx1/Jo6XnXHcl/ZHPXGfc/ffSWRPGcxE/dm9g9D3uTWz/mE7Kj
         qGoRkaF3TwMof57UmDoYVu5u8NSKVq13CtebkSDzVgpn/bF5VYhAp3yYLfM8cTF47azy
         NsFPcr5PItSOVWB+SiT47LglS0b4zWWlIqN0GAEAdbBmS7Zqx5yNTd5y1Uq04wmZ7Epn
         jCwA==
X-Gm-Message-State: AOJu0Ywt02Klor7O2vf8YdxyJ7UZDwrpJfdDgtDHRC0v9zhfs9n+AssT
	IHwegA3NVDT1V3TTo2rpXFt+zGgJ2BE2jZBWdPzvmv39UnWzuN/4ioRe85suZM/QdZULuhcAjbg
	buzoJ0NszRrFr3kkZyaKH8INxcc+KiVXYf8Rp+QLNKezMlXqSil1k2EeDk7YioK7i
X-Gm-Gg: Acq92OFf/8vYgDiVjytbuWYCmlRDfascqed9ZOB15w10V5yDDuPJM/wCEfWtDvnGF+R
	NVpZVegk0PBqdp8be17az/HgK92qWxWcJObaq3b210E0NzHpZUj52rGhB/u+7NDwdJK5CQYyRQq
	yYktU4/PXxSKTB1+ge8pPIh6DOoMi+tjKjjPJWyFvTFaxUeVLTv8QepYrddKEkgrTLPJG04dZeF
	HBYRrpBPz2odU/58h2Jury0VmaBkGT6QiqIrclYIbtnbqn/EpCtTe+GZKAwggWiELMw7s4fsw2e
	koc9pgnL15dhtZu3PWwfTtzo+tCIvPdsRHMQ78ox3bwdo7ZPSvIIzVM5vROznGj25OM5Z0WXtQs
	68EZ3w+DwtYh9SIGLxXT9q3S/Q/kGiUzyzw068ybDSDd6CQpH/tiHnESrk5s2fBRqo5nahDgIkC
	v5Ng==
X-Received: by 2002:a05:7301:9f03:b0:2f3:a348:a2db with SMTP id 5a478bee46e88-2f54c280b01mr13358612eec.10.1778561355050;
        Mon, 11 May 2026 21:49:15 -0700 (PDT)
X-Received: by 2002:a05:7301:9f03:b0:2f3:a348:a2db with SMTP id 5a478bee46e88-2f54c280b01mr13358600eec.10.1778561354518;
        Mon, 11 May 2026 21:49:14 -0700 (PDT)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm16032926eec.11.2026.05.11.21.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 21:49:14 -0700 (PDT)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next 0/2] wifi: ath12k: fix NULL deref when MLO link activation fails
Date: Mon, 11 May 2026 21:49:03 -0700
Message-ID: <20260512044906.1735821-1-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02b14b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=AAKCvc--jUWDOs3SvV8A:9
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 8drr8ZXmXLCDchQ0RPhojSDTswh0RnJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA0MSBTYWx0ZWRfX7g+9Uda6fcPm
 cQZwufQbl/dczat0Dnkg7ov4vMkgjcMr+Qav6cCX6feASc5HmFtxOnzub10XDKydNKdWBSNQVyQ
 cD9jhQ3FuR67bCwkdsPJ79gLb5mmcdjTFmLpqX1werrwma7Kff1glzYPBuX/iOYrVbifPkpcZkM
 K5r1feodZM3HI4gU7iWMlDFYPZW1bumc74X8lE2pymYJkKnCwmk6/BS+BnXlBMxFcQWXyXjgW0U
 8vfAFR1IUdCQn0Y2f38RORpejZFK65RYK8w658NHbeIw/qIiHZSmw4rPfbxS+eZwSb5uFuR38cH
 O5JDz1DCKo22GhwyQp6n8NdPYJ/TrHRiSlXYfrxxQayJYIDXXqCiG5PHE+AQmiwSdU3IBvn2NIE
 /ux71WjKyMYYqqRA5yawSxMfOS+AO2jd0AfOznIqnGIxB00uXb7l+rFtR70jqb4phsAzJkkOICw
 iZ9mfthgLKu6evj/E9A==
X-Proofpoint-ORIG-GUID: 8drr8ZXmXLCDchQ0RPhojSDTswh0RnJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_214916_732383_4F7B97F7 
X-CRM114-Status: UNSURE (   6.53  )
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

ath12k_mac_op_change_sta_links() adds a link to ahsta->links_map
before verifying that the link's vdev is ready, allowing broken links
to be processed by subsequent operations and causing NULL dereferences.

Patch 1 fixes three error path inconsistencies in ath12k_mac_vdev_create()
that leave arvif state or vdev resources inconsistent: a direct return on
wmi_vdev_create failure bypasses err: which clears arvif->ar; and both
failure paths in err_peer_del skip the DP peer cleanup and vdev rollback.

Patch 2 uses arvif->is_created (made reliable by patch 1) to guard
against links with no vdev before allocating a link station, preventing
broken links from entering links_map.

Wei Zhang (2):
  wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
  wifi: ath12k: fix NULL deref in change_sta_links for unready link

 drivers/net/wireless/ath/ath12k/mac.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d
-- 
2.34.1


