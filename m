Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BFBC5AD7B
	for <ath12k@archiver.kernel.org>; Mon, 10 Aug 2026 17:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nyoLhihJjdwqSGGnb3S/J4e5JQxUyE08Q3QaNPioRts=; b=SCqn2UVzTtz38lFaXcmGe89Rjg
	r0ezau5QfTczqudUI8jaA7lhpLLz6Y1y4waQ/++SrQYd3IPGbp5s6hVjpj6gkP2LLF2P2LvdD5Gko
	Qj8aWLSv2IOWsn7H0rjykChHc5HBh8eRdhp7SxQy0bLFA+uaBpLHFBr6996b0En1cBQwvvQBJXifO
	TKft+apIoJmdwsfBbVp4KygCNv+qT2tZtp7xzdMMbWlH6PcLip/Bs1sUFw2ydZRONSrUGBJpkhFUa
	5R6sxZx4RPvunMof0xxvBRy7JUvNtpsf6vKv9jMJbY2mkpxy6uF6krtjZ6rB+1uVLaWqfP569Xaqs
	dc7wBtkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTS9-0000000CTNd-0ZAG;
	Mon, 10 Aug 2026 17:06:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTS3-0000000CTMR-1OEL
	for ath12k@lists.infradead.org;
	Mon, 10 Aug 2026 17:06:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGDxYe1786705
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 17:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nyoLhihJjdwqSGGnb3S/J4
	e5JQxUyE08Q3QaNPioRts=; b=J6RCDUstZCKXyA/Qjigbx1wJS9D6n7i37KSX4L
	RajJ74la/2jWj24gu8gnqv6KZq/3O8iSlOEa/wdYLgnKS4fWawkXm3hzxC+BI2JZ
	9oIOla9406mM132+Rz7wrHRZ4JId56NVFxAlwXpsNWRQsjxOzLz78uiGjw3sbTob
	W5UJnwGNolfo4NbLjv0ESZ3aTusZldnTJwQgWNZeT/VnUU+6Wesbk54iCYHvfLKW
	X9FNit94drdxqqxyygepNZ0q6PJhAzBcKqr7GJ+RpXptk0ijCs/rjMLlxYPvEzbb
	3mrzB0gZgMsIo8PSma+DeEf70aXZVd3LWjhbvOddqvZDJj6Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyccqsus6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 17:06:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3109831a91.2
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786381573; x=1786986373; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nyoLhihJjdwqSGGnb3S/J4e5JQxUyE08Q3QaNPioRts=;
        b=Qtx+GQ4Zjk+k69GSF4WHLKfzPEao/KhcfoeQXh9WDYf7jZ9K8S620zF8vyPgW5jAoz
         4SPc1mVdUKg7/43T3nE1hn8Q2qRW+Gwh/D+bWO6idP5YgUlAuc5tdkbd8v3MTMPA6eGJ
         aeLJ683JNYk8S7J9zdI7OXNrrp9kA5wm+QkMORzhexNtnDyfXYkKnM1e+twLLZ6C45B8
         COYn5NnodpOcSX+wrz0vrZS948GUP5AHXYM/D8wJ/QWQFHLuzF2J0NvZUecykGF2Q3el
         UevxGeJQY66SqFCHRvKvotq6w+08/eFj4o+lFeL7QLk+l06hj0YzMH+vFxyPVZ6Rx1P/
         8CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786381573; x=1786986373;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nyoLhihJjdwqSGGnb3S/J4e5JQxUyE08Q3QaNPioRts=;
        b=Ct4YnNaO6sD9su4+7aageVVBexUJvXxr638bbPZ+Ahnx2I58+taMJtvhT0nTqILJEq
         IPUEjcZk6WMH0nl5zzG5r4mM6DwF8Ba2LKBItdiuNRx9F3dhV+qHZbu0/DU0zcUXXsY/
         Vehku4Fw+MSfmHtJUbPqZGltCCS+2eWRyJl2YpB/vgRvuJsdMQNlnXybcVbH/sM8msaC
         Xcwsq4Awhjao4VXU8hT2f3b9m5KN3vsC44vR/2/V8F3B3y7XD99WCS0tRWom9dZaToil
         a8IWhTFHjPGvANmTo7NVYAHmQEeqJ1LFhTgp+OwRuraR8delVRA7D0y/ui1ecMtG4x2z
         CJPg==
X-Gm-Message-State: AOJu0YyrGYta6De6t+1Xc/XyqukdOqBDF4baU9glgu2cAKsyzGn9FXM9
	eLdg4628ZsTnY47VDzrymyfDuE48qrAebgHFHwSM0e9MHWD63af8dtqITyPy7YvSHdZ2zyadP/K
	Wm+iNGBFT8DWLb0jvO15KngyYXlq0esJY+wlxamCMZRZgFjVxjjqvJyubeTAqeGYT6g2q7dXx
X-Gm-Gg: AR+sD12Sg6kmGTyuNNnSTFe4o9nYkciSfscDe2ZS6aka+wDMCI+rP1BuQg7Uqr594hj
	db/WGcKTlkKQoTvWKLpyHBIMUEXQ4JQGCtAZMkXPrpyigzolCaSUgKD+d1WUwMhnr3olJka4Z7g
	mPAjiKxT994vDktZ3PkMl6Got5x4anR106UiJa35vdICxUYh3zPvKr4HvCOujYq8wmLm8joTaEB
	DGysLwngbPlPxY+NwP6C8ZbfVQw8pj6gs/IzymoAGNi5BnbGnrA/d6oqo/FtqwSHhw3ioLTBRXJ
	gu+xMYDABzmH+Oc4b3hJ3QdQQIuWqtR7TqBM3/k2FhIp6qToJgTkBeWajWDjBHsd3aNRNFDF3dJ
	TcV8/GP69RguCfuuqJ+fHv8ARrSsXaOYeJR0a/KzV3R4+BaLPKx/MwcKqqhreTaiXxkvJIgGRNH
	qzG890Dm6Vmo7mt4Wx4PTu6LJBnWLseBTi
X-Received: by 2002:a17:902:cf0e:b0:2c9:9a19:df with SMTP id d9443c01a7336-2d30056b365mr37441195ad.18.1786381573617;
        Mon, 10 Aug 2026 10:06:13 -0700 (PDT)
X-Received: by 2002:a17:902:cf0e:b0:2c9:9a19:df with SMTP id d9443c01a7336-2d30056b365mr37440375ad.18.1786381573136;
        Mon, 10 Aug 2026 10:06:13 -0700 (PDT)
Received: from hu-mdharane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88473sm41592653eec.17.2026.08.10.10.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:06:12 -0700 (PDT)
From: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 22:36:09 +0530
Subject: [PATCH] mailmap: add entries for Manish Dharanenthiran
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-mailmap-v1-1-76b680fd0dd4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAFemoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0MD3dzEzJzcxAJd89RUI2MjoyQj89RkJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAK9yI8NrAAAA
X-Change-ID: 20260810-mailmap-7ee2322b27ec
To: ath12k@lists.infradead.org
Cc: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-5ef6c
X-Proofpoint-GUID: mc4B2bpyTV7bcGbTkF16o4rlXTua1Lbz
X-Proofpoint-ORIG-GUID: mc4B2bpyTV7bcGbTkF16o4rlXTua1Lbz
X-Authority-Analysis: v=2.4 cv=WNVPmHsR c=1 sm=1 tr=0 ts=6a7a0506 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=LpQP-O61AAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=BLX2waBPNL04_UhFC_AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22 a=pioyyrs4ZptJ924tMmac:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE0NyBTYWx0ZWRfX4njeuwUOlPPa
 nwf3htEFyMtBS0AU+U6P3pnDOXXBU102KeVXX+0S1O348VgIB33SYZH2fMKGnCiggcZU+b9Bcww
 VrC1+qWGTQcCVUEajuH0Qg+En9Z7W8KRzz7hUXYcptJzq1TfmLXPGpWgSmteKaSEQ+hgg6CyEUO
 IWS2KT6JyiXVc52cTT7TVmjd3evJOX+GNfAOz9T2YYDN6gSQ8PluS7CJVolCc5enjShqbdp9UrW
 yrwosRH1hQivOdpw7dqnopS+tdNlQmYRAYGmdf5l4R/3rWfhjOmWhWREsmjn2BjJOdm0XJumq2H
 bjWLFrc5g72/uZFX9fYmVjNATWUaNjsOF81FW2j9AeywRLNE2RuXWZVonMeMkuS5EQlX/4Ix5rv
 THyy+2W8u8X4ioqQI3achAu9j2ux9G2dc2c+X7pMHTeDjI0hJ9l/Nhqd0KHrNR52H64KkpHhIhR
 rOuHXh6pn5+e2PNUdGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE0NyBTYWx0ZWRfXw4KhSMvGaMBt
 28OeMBs9TAfeHx5I9U3YnvbQCJJo4BoOUIHLpEHu8T2FIMxf9n8F3Z5opJ/1/rEt6DHNNDu7zwm
 sNq7f4oGXMCQWM6ez9plrS2Dvhz96TQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_100615_379033_65F029F5 
X-CRM114-Status: UNSURE (   9.02  )
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

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index aa09e792017f..15d8c989aace 100644
--- a/.mailmap
+++ b/.mailmap
@@ -477,6 +477,7 @@ Maharaja Kennadyrajan <quic_mkenna@quicinc.com> <mkenna@codeaurora.org>
 Maheshwar Ajja <quic_majja@quicinc.com> <majja@codeaurora.org>
 Malathi Gottam <quic_mgottam@quicinc.com> <mgottam@codeaurora.org>
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com> <mpubbise@codeaurora.org>
+Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com> <quic_mdharane@quicinc.com>
 Manivannan Sadhasivam <mani@kernel.org> <manivannanece23@gmail.com>
 Manivannan Sadhasivam <mani@kernel.org> <manivannan.sadhasivam@linaro.org>
 Manoj Basapathi <quic_manojbm@quicinc.com> <manojbm@codeaurora.org>

---
base-commit: 8fa552366d1bc533fad09bd4b51982b3d6bde8c8
change-id: 20260810-mailmap-7ee2322b27ec


