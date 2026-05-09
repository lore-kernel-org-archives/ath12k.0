Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9C0CD37AC
	for <ath12k@archiver.kernel.org>; Sat,  9 May 2026 02:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6XRFZm0NAsuadaRmB7wsJfGC93yIK12OgGYkO6e1tTE=; b=qJCnO+RJc02HIRYqEbgS4GLOwi
	SqVg1rk2gVLnVoGqbrfmWF/QReqB9yw0vqXNTs9USwZJB+yiMyCKioxFXRGR47kv44LQwBw/As6Ma
	o14FqioVEEJu6WThrTNO6dVDifr2OnyhKFm1b3MmA9E054GJdHHXdso10zaaGgE/QBstnVgBQK0rm
	rpnMXLNnDEoEENn4b1BjWmky2LuehhDU23TZcQIv+dOLnugixjb2Ijm6EyEdsqYRMhePqDOp9iMba
	y7PIW88e6qbbhqIL+yUZuApffJ3hocOsiWnyvYkXSm8jFFmLfaevQ9xKlCHN7Svr2JubTvaQH0Sbs
	N7NeIQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuO-000000084FJ-46tk;
	Sat, 09 May 2026 02:59:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLXuM-000000084EU-0GG0
	for ath12k@lists.infradead.org;
	Sat, 09 May 2026 02:59:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492XwFw2770094
	for <ath12k@lists.infradead.org>; Sat, 9 May 2026 02:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6XRFZm0NAsuadaRmB7wsJfGC93yIK12OgGY
	kO6e1tTE=; b=krltR/1EWggIRgNE57+uc70XKdLsXQ3MlhXU9uJGjRRW+8p7ec1
	PLD/a8yG7wK0DziZ4t6rTXAkYZqPa0hqS+ts6yLBbYTfn0BGsOLS/5wS8/joCzZK
	DVy7ADCPcrNhmd3pSQ/yHJ9BPWXTiQqrfLJL/nFJMzOkTq6RfhXNhZahNLm0qebE
	C0+GOxwNi6+M890QaU60uzu8KQpJ39FJBN8PxemKbN/3yUblyM9kBLMk6DCPGveK
	m1Jey/ZAOzSeYeZykCTDZlxrxRLkEKSx1ek++L2Ia9Nr4And7Ozl1OvLSWpPHeDE
	W4GdmazRHChsby/scEL5Zg2EME8OrfI8bqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1v8gr192-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 09 May 2026 02:59:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36629e48023so2818557a91.2
        for <ath12k@lists.infradead.org>; Fri, 08 May 2026 19:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778295551; x=1778900351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XRFZm0NAsuadaRmB7wsJfGC93yIK12OgGYkO6e1tTE=;
        b=K1dc8v+tzxhp+CH4mFzFeD3XMaqEuBdrL/K7JGz6XMFKTfehV6vR9IKveFSx7OPM4Y
         ZK6sSErPjxOajTrpjFN+jrRlihE5kBeC7VU9l88Pn5CAMuUcmrdHcbNiMgM1LTluG8Km
         hMoJoTp5S3yy3JPlcmLm4ff3fABHXcrtYlD59AfHz0Pb6mjn8KZetWn9OfjUjqbYgfsL
         BItyOXTGypV2FIqQF4OEENUNdUqCTBkX1YhGvCREqmTpMlufH32NSRxYjk4/nwBJpzdx
         ZQD1ZlqBICukSH/krsBXIqyiZCqyWyBUiwrq0NSo1/qgnjMOKUmhfbcsvZKDJsfLYVy1
         hYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778295551; x=1778900351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XRFZm0NAsuadaRmB7wsJfGC93yIK12OgGYkO6e1tTE=;
        b=OeOQg+3AyOMhDb7NVRkovQOd3k4EQ9qbZlZFQLb/nIzS/fzvU7VtyVhDSlq3icyiZn
         Fb2QFkcY2BLFIHvhKiuIEB203f17SNGwaMZKqfrF0z3tw3da7m3/QFZ7MqgKmcX2PVA9
         KPZ2+96r77NeVG4W08EhKPCFFQ3sZ+z1H9EX19fwu7mJeICm5VUfLgppql9RvmcpbUo8
         7UKAN2wxDFoMjVKxiUPxi6qQu+6R2sFhar4gbwSbWGqhVU7BE/O6yLx1O8j0746Vy7LH
         VRaoA9E4/8ZLOoG6A9jxpMNNrJIcNi2zzsA8/ZJ1qDELRrCcISJCnXBXWoq5fBcTwztK
         wKwQ==
X-Gm-Message-State: AOJu0YywDQ9nT+piH1Ks/Ewj+k+0ILhPHWTTuqUPeEZEktLVU9UTXFHO
	BKttgs9pmdyrc+ax5e7TkzRcap1nKpkGXFfBncu9kfDUQk9a86AcdRbXG0qhhONhvax7+oJ+CIB
	Y5ntbTvJolncGoLwaw2E+2beN14/+FedX/gPZYFoPM2dv1Jtw4MVX7UZiP7S290P5
X-Gm-Gg: Acq92OGO5WJ78W6zR3wAO6EqR7AvP3KYCSvHNncJitW7dGr0Nv4abyo6gSdyGCDZNeB
	0BZ/VXaD79fYhBKAkRAb13dLZZ7oD7A7iHUVg0kwkkH1pMJEYzo1baJBWXMeQbJtASxPOmjA8Rc
	3R/y574vk0/8us0OC5p6RYq5+LKps6GlYICheNU/8DaXYaCeYyWC1O0iVILm4/fJFluU5QRUI4G
	JEEFu/YOzoPIb3EEBmUq0qZ59c5W1uiSR/sO515HdDvQlBWcu+/T5JFaL3IGOWuX2+r4lxrFn5f
	MOWVOSw9G7z24QLnhWj5udhRqJRO5o0sSO6OAPOzk6OlWNXmD9DQ4bYm/sx7J6Yv6d66V3MqDff
	NWyLlTWn2cL4zzVegML9nsOz5iJxVZhQfykTbu4apvpMDHIVGoyJTnyGjjg+1YFm0yjD2kZeCUy
	XHU75y
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr15966868a91.25.1778295551214;
        Fri, 08 May 2026 19:59:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-365ac79c531mr15966839a91.25.1778295550772;
        Fri, 08 May 2026 19:59:10 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be8be938sm750899a91.4.2026.05.08.19.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 19:59:10 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/5] wifi: ath12k: fix dp_mon RX parsing for 32-bit TLV
Date: Sat,  9 May 2026 10:58:14 +0800
Message-Id: <20260509025819.1641630-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fX6HcVTFJwGMee937m8q9VYaGkIilQWp
X-Proofpoint-ORIG-GUID: fX6HcVTFJwGMee937m8q9VYaGkIilQWp
X-Authority-Analysis: v=2.4 cv=RMCD2Yi+ c=1 sm=1 tr=0 ts=69fea300 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-ltJWcRUgt1K9avoLbMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyNyBTYWx0ZWRfX+zZaCKVgfdMw
 D1BS6YguhSohyQnpL0UHtc9ZkGg3LMHPLM+N4oWIZIm6BdwQn+W0RJRNIxNexn4EDuTYEKGt//T
 02KMzlO3AWCkladq7tDf4MbLMWOaxyjnTnnmhhRQypfLGMlXHp2MuWRXSS5dvVg9eh0TwoMKd74
 WNXLqDPH7GBeJl3xyRMgnKUZzIneaNbPtQ2dcXGw3tSWGEqEUImIR2xD5786rFPOGnd2QsuO9qF
 AfxhjeJkoea+7CcFv903zIlAUOcwvDSFTsL6i7g4uQhCm0WsV5EPXkgDFEIbIxPWj+WZvTju5cx
 /53HLZI8CKjPJAVGteH2y5BAK/p+rKsNMUTOXZYMv6H3r8xzY36q46ftSY0kqtHanKgQILm46P5
 SiEYJBPS1yp8KFnHsdlNXGQovxx+Tl40F9/EfcyCl9eOKDmRAmumgIvxKzfQJMOH1GVK+4kOuPI
 jU0RMyFcIgH1bpnElrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_195914_245470_06291205 
X-CRM114-Status: UNSURE (   7.36  )
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

This series fixes RX monitor status parsing issues on platforms using
32-bit TLV headers (e.g. QCC2072), and tightens TLV decoding robustness
in ath12k datapath monitor handling.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---

Miaoqing Pan (5):
  wifi: ath12k: fix TLV32 length mask
  wifi: ath12k: refactor HAL TLV32/64 decode helpers
  wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
  wifi: ath12k: add dp_mon support 32-bit TLV headers
  wifi: ath12k: tighten RX monitor TLV bounds check

 drivers/net/wireless/ath/ath12k/hal.c         | 42 +++++++++----
 drivers/net/wireless/ath/ath12k/hal.h         | 13 ++--
 .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 59 ++++++++++---------
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  4 +-
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   | 13 +++-
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   | 13 +++-
 6 files changed, 94 insertions(+), 50 deletions(-)


base-commit: 14d99bd40a8e3a80398dc597375fc7516ca488dd
-- 
2.34.1


