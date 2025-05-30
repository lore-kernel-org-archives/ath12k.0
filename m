Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834DEC3ABB2
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 03:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jdWd0ET8Sph/xs+o09ASCjrikMx2pDVrlCs20H21d9U=; b=OwXQx2IPV7R/PBqRNRmAtZBis0
	VngSKCf3VKmJhITE7WFjnPaVyUYz2+GUlnIJfo8429O0ho3hbgC9IUSFu6OGlFhsBNtyOsYQot1Zm
	eKMYhSNb1654H5Om0gkihJfJhloBRdHqDO9m9u3Bg96SMgd3bKrZwGIitJ4RgoIdj3aQ3JV720gqk
	MT7f4fRyvWDgPIHWrEpqgHUlyAFhLsIqR3dKIr5gnZv4IrXembZQ9CJer5TWZ7jvZrRQtT9CJvH+a
	YkynCiobvxFd4vlwauhXgAqpAHJVN/ZEd1RQiseftaD0/ZV65bz37IuXpo1BTfvtBs7RbwKD3Ia0D
	xVSNhFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqst-0000000H8ld-102t;
	Fri, 30 May 2025 03:58:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqrK-0000000H8JY-2U0V
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 03:56:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TNbIu0015896
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 03:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jdWd0ET8Sph/xs+o09ASCjrikMx2pDVrlCs
	20H21d9U=; b=ID+luq4BKR0f+50C746I5rTmjqJVfqJQD+QaC7QfFDRXREauU+M
	q6HB+wBEWMGAMtG1Gh+6hEteRp+tJtQgwrHUvBBlypuuf2Nu4GFPq6zcQfJ+nsj6
	kbyJL/YSidaLQ9H94razEeDR5sLhlnn3T4UIPe8UNAT9WwvwVG1Lw91/Ypg7oJ9U
	2MtTbUWGMiS3Lzp/RNxyBceQIwCF7+dxbcBrSeJk5BG80WLPCM0dBNF8aEcpjA1a
	1jFZfGdb2qAMqUFqeNkXwciBH+6VGEjR2q9GGQ6S5dicwyDlR0zu2lwvniR4nDI8
	np6FRf2tbCU9LioT2aAc92IF+/wqNr5TZZA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm1k4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 03:56:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74299055c3dso2075117b3a.0
        for <ath12k@lists.infradead.org>; Thu, 29 May 2025 20:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577400; x=1749182200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdWd0ET8Sph/xs+o09ASCjrikMx2pDVrlCs20H21d9U=;
        b=pomBXsDPLHU1YDoI/3l/yBXJXzEWw2sD/XzIru8Q2lUk43BjZRHRPps5bLjgMhHmkx
         xFxNX1RAUKoseAF2+FLEKarVvv7dmK8yW1juRqxXqsdTIvsH5/HRDXgyERmShAemBpFc
         KHNFmNloEArgY7A4jBOL5hTWxeORsK1G9a4LG0J/UzPkK9+iqq2699toGSVlADLq0kRp
         yqQWrJgWKDUfqT7JSvHswRPNJ3M+6rwjDRkbQIqhBlKTxBisxqGQ4OGPha7rxLIYz13P
         wVJBlgSfUHKa/WVeA+w4hhXKxPiYnJqV1kOQKCfbNAiSJjoCBXfSog+YMy0gDlIY8fUA
         dARg==
X-Gm-Message-State: AOJu0YzdVb+bk5weg4wKWZa1v07KsOAcfyz/wg6nGpaWCFWyuHvLE7Pg
	YTHXg+ieIlnoKC2+MxPzt4R2iUPQ3sLtbRfgx0UM2QLGwLXEsVWLLQMN3GYN1AfsL7RH9yMuFTt
	JuQjvEu9omAYs95kAJbSKI5IVNReO37pthREUr09FBIF6+r2KwlPU3r4VBwBATqIqCx/KUEKx
X-Gm-Gg: ASbGncuBn45IsnXQo4CmYwMXqglegoodZxqa7SXqTjhiwEFlP1dwsFZow3KCCnpiW0e
	7fEo7XgJgPdj7Pzf32ol5yN/U0KUfBXnlqHk1TwM1lXQOWdbSDQaeBujdV609cLDkMalZ1yKFXr
	GoeR2C0Ch++Z75DjO4UgGDo4Aey6qu4Y5CrQ+uk2M3hm/V/QR3V+uA7JeJplVOSCRl12HwQwTNd
	IFLW2x8iEsY+7gGE2my+R4VoATtaJPxFbzQlhlwLAl00xiX7W6+hZG/8C0Q2qnJlgKMfdZo4cRx
	K4I5A0h9+MTnHasH5VxdbpieV5fJzfXrzGJfVvPK/zJ37A9MnxS61NOQo0zeM4qGoc8Y4gc5hzz
	SzANpEEAx2IGiSFl81ya9mIPFcWygbuw+GGPBgKKJ
X-Received: by 2002:a05:6a00:b49:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-747bd9e6d31mr2803341b3a.19.1748577399749;
        Thu, 29 May 2025 20:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnPc/WuVpNI3oK8G5Hxv8hf9um2vwaLwsn79HcV8zB9Xw1b0Gw8UptoCSA1gPy2MiCTeL0Dg==
X-Received: by 2002:a05:6a00:b49:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-747bd9e6d31mr2803313b3a.19.1748577399348;
        Thu, 29 May 2025 20:56:39 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb96fe8sm705274a12.59.2025.05.29.20.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:56:39 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: Fix station association with Non-TX BSS
Date: Fri, 30 May 2025 09:26:13 +0530
Message-Id: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _ydj_OQKS3r1_NmPSRIE8gxc5KuNqlpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMCBTYWx0ZWRfX5Uvvuq31DkAK
 MJ4bLehpi99i8qhLRlnqLyxNh936MNIPItHlhCsOvzYdhBmnsuJV9lqrK3yvs1+8IgxUu1A4X5R
 6Kw/+nGIN/u+uXq2TDbVY7TwcXrOUUaiExDg/0/dPWsCYHnTc1c/YGopp4BMtyeg5gkx2uelzbw
 opPXrV1BbVlolLUUj9/IPqNM5WkP5kLNTRn4BTnw7xOEze4erkzmAnzV42rukiw58aIs19EqljP
 fYx/S9ZOFH22ptmIUUDT6VKThzI0bO6uin26I5gP44s5yhi2vV00ODUsO2rlTM2jGBTbYOXx2rm
 8pGoTiLRB+UURYPITW4Dlo77qSfCWIXh9ybaI1zeJyIFKjHdbojlpSEn3H9W6qEpABpyjBe0LTC
 czMM90UIvvOfrU+3iFqyKiZSUATFdCnh4oFrJShdpzN1BIBqAZW40W+WjjSPD0q7dtpx9zxS
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68392c78 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=FOfoRkoqiD14MWsr1q8A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: _ydj_OQKS3r1_NmPSRIE8gxc5KuNqlpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=813 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_205642_655390_0B4E42A7 
X-CRM114-Status: UNSURE (   9.05  )
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

Currently, ath12k Station fails to associate to non-transmitting BSS of a
Multiple BSS set as the scan results from mac80211 does not have
information about the non-transmitting BSSes. Fix this by advertising
driver's MBSSID capability.
Also once STA associates to a Non-Transmitted BSS, instruct the firmware
to keep track the Non-Tx Profile's presence in the MBSSID beacon
transmitted by the Transmitting BSS.

Hari Chandrakanthan (1):
  wifi: ath12k: Fix station association with MBSSID Non-TX BSS

Rameshkumar Sundaram (1):
  wifi: ath12k: Fix beacon reception for sta associated to Non-TX AP

 drivers/net/wireless/ath/ath12k/mac.c | 57 ++++++++++++++++++---------
 1 file changed, 38 insertions(+), 19 deletions(-)


base-commit: 5b5f14fc4d737a956dedafb996459c4276f4fa49
-- 
2.34.1


