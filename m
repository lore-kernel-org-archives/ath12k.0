Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D60FD8FC3
	for <ath12k@archiver.kernel.org>; Thu, 26 Feb 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI7jqudlT/nod2vOvqUoKazQSL4u6lDKrUzQlW7Lpvc=; b=rzITLNlVU1F1wOoaQnSQ2Gaz8+
	QGrU0fG9CPN7WkEKAV9ZGfFKt1hxvFNNefr1SEA8KIzawRsNCd5q6S9KybhgWjSIcpi2A4K60GIbL
	otqKH1wM/Fjzx6zrkPg00M/E+0qURmQSrIuhjFsC5aSlaqTxsj8g1Bnmiih/gMVrE75FJS4BUTKYs
	GYwtFkoILLvbJJNOc02N1yMwyqqAzmx3n9ZsfyS3ipVdGmyRqV5uz9Bj6oq4L0k4GdI/GcA91ljkU
	ow+2aG/p0mJqZhTgqg6nXcROzeqcN9wfiwM/blt7Lcw2mhJlxEoEiuOZfl6SUtuaerX2FwsosWRlk
	pzBvvcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdGu-00000006VpX-0qPQ;
	Thu, 26 Feb 2026 15:27:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdGr-00000006Voj-1GdK
	for ath12k@lists.infradead.org;
	Thu, 26 Feb 2026 15:27:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAhci01160889
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 15:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uI7jqudlT/nod2vOvqUoKazQSL4u6lDKrUzQlW7Lpvc=; b=WjXG+5eMERH83hJi
	qo/667Jjzxc5nZpLAaGWfiUgNnQXIIyRJ4UXB6t/Hzj9PSJpV8MvXYX0vgOC1UN+
	KJQT7R59iSfu6j/qCFWIEFnssV3iT95qQ5SqUWuUPwYfojfVEtMmMPMlJzHFI1Yj
	m9euBdKvFV45+0jIHCTncnU/Uln9lEyTQT+PlUroXRcsbXVWDQ1eUIdMlKrzrGLS
	MUp1X2PZnBslGCv4JhdDMbHbY82vvP7bka7UYR7xMOGLepPJ9Tl0JcTyhnxUc312
	BNORQKrRxcKHdYnJN69gGxpxDxCUERASiSAFBdbnUlxsRTKqyGSkVXqqwPGhq5Hu
	TPNL7Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp60var-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 15:27:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4bd29099eso12602063a34.2
        for <ath12k@lists.infradead.org>; Thu, 26 Feb 2026 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772119639; x=1772724439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uI7jqudlT/nod2vOvqUoKazQSL4u6lDKrUzQlW7Lpvc=;
        b=T6BnyXTWnP5Wv06sHhhyunGAhtuZAqePAZQg/Nlc4Vp3Tos88SQGnFnTml1zp/I/Xx
         VS8tXI5tZso9FQj73kiHNSISvgVYgTcLCA8tyGkHUiYBSdDRifa//kL9/3Scsfh6NymM
         GEFfjjeF2sHe8FWiRc3Fu/Ktf10OFUXik07VHkzLoSOy4FwCN1UFQOab7bNbBOnwkVqp
         F2SKi1QiRMbsJ8rGmGOKX4UkIVomqjES4CvzfMFAtKlv12ypv5pefSAtbPzj2sJGwiiL
         /0P9AO/a9gGp3Z/unLhuUgOzDaZKyWjw3fN4fV2XgR6OjxB8nJmWOpeaeUOSeNDLFfTw
         QnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119639; x=1772724439;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uI7jqudlT/nod2vOvqUoKazQSL4u6lDKrUzQlW7Lpvc=;
        b=GTaHCTB8fAIFmo/c7zRNd3KSxvMZwSRse/bD/eHIQZko3Y28lUAqCapv+ja9fYO6md
         Zv10mhiE98EpNrTp7K4+f1EMZ8xrSARfhcGcaZ2B6BCelF5kYY8MLnUDgocJbl9Zxpdj
         2mnx/VACu1M/r3nRgeREbb2I8XHWcbIR9SbC2mNFNX+vH/sBjI98kkcPMPQ4Zi3J6k+3
         EAumxoVgi79hk63EDnhecA2i2aDJtyOn1NuHpFQCjitEEFq8sxOXc+xIum9k4O5+QdmE
         k8xxLehSgucyMN6jINro3DW7aB5JZpeOPfve91nb405BqsG8ijlSmtyaE9TZvyo2kcfz
         3DPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS2Bl714/9VWsI2s9rTJO3IwhYemmp3Oddkp4lQB4l4UzoO0crH3oKnj04MeqC5EhkiBT7Pug=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaLmMvSutBm6x+MKu/0EYfUOwnS9w3MM8mUwft44m0Kq770a9k
	Bpfz2uOFmotnVhTdslR2ISJVum6gMFcSBV4vsdWgcXY3K5e2nAsYMZof1jU17AhBMr1EMDFkdkp
	lwPY6lAi3RISZbnMD0uNtytBfjsMBiBMe2uOc4ctPiZ2e3MlTqA1CCwquobwLyNxbqvsjJz0F
X-Gm-Gg: ATEYQzyeo5+rDi71uRkXGStmAYlR2lipT2RznHIH1pleTX1x6NeX06NdH+t4T/P31OA
	MDs33Y34XRzC+yh0YCgAJiIsYgZcsYx0E6+h2m5aeJiS0lbeoXbYI5lLymxCgLVsPO3LFi4sF/H
	vEfqvyyM1c50rA4TUgf84OprmfWmL7c85SGnv5XK5Q1F+SNFUtBTCERdSUi4NBpIgoO0R6fw0JU
	OpkByahrG+0o+ERjFmmlOQTv95gNg5Hh/hnCARhPsn+1AJ1wgcH/qaOvOyY0DEYnCeXCztqe6jH
	gGtB6sWUWIrI3QqzFEXrkJk2r/OKH3nBPKb3JJX8i7Q4uq4oMPwnEYxSqV4q+FOvHXt/+pr6ziJ
	H/DdTePR43ZjBh8iOX82ZdLru9eu3/enD5GYZvDc+0TClyyvRWYomaFzVmyjTXGOHfiYSqcLAdm
	Ng
X-Received: by 2002:a9d:7f85:0:b0:7c7:6558:277a with SMTP id 46e09a7af769-7d52be7aa1dmr9465095a34.15.1772119639202;
        Thu, 26 Feb 2026 07:27:19 -0800 (PST)
X-Received: by 2002:a9d:7f85:0:b0:7c7:6558:277a with SMTP id 46e09a7af769-7d52be7aa1dmr9465090a34.15.1772119638904;
        Thu, 26 Feb 2026 07:27:18 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58666ed17sm2085996a34.27.2026.02.26.07.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:27:18 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
References: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fixes to station statistics
 request
Message-Id: <177211963805.49925.10997614192406169999.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 07:27:18 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: dvRR3sj0rFd4HTpYiMNwDddDob69qwSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzOSBTYWx0ZWRfX2+ssGA+Rm4Gw
 g9kBwpnwgvKH40fU6h/+lRczIn/780WDjHVIVveP1zphn+tzzhghfFd9SaYSNQ0Vjg9pu9dXwIv
 qMCYNlqzJ+CDmyqJwmqfBjmAHfrGU/p/FTx8fdn6ykQQ9+HgywHJrxQUuZOkcRKClAIBgmu7LSw
 yzfPhVqLwXJ7phvuHU8LriZjzbBZOrnVAau2XQZyOt5/kaoNkAt8lgdzJTNvgGg+7jG3Pr6fp+J
 2KJxQegTsSRfU2zUrVq0KKZALzs7AKwxBo0kLXEZbZu5el0DpYj/u/LU2oJGK29Y24D+vM9zUSi
 LLFLfaUL840lQbuhk7bcr2zhljHVEgXc5u8t0OMmOigFv3K1excyhhrWuV8bx9AI+MabbjQVhTl
 8V8W/tA3NkskA5MLguQC55XxKhgQtTp3bxq0CuspIILeHkdIZyyUGNF0LOaviGeELhMOg/pXb4I
 ORTv//C9gvvzb2ffx0g==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a06657 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=09yQsDFYmmylyj1ORGoA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: dvRR3sj0rFd4HTpYiMNwDddDob69qwSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_072721_464379_DF375BBB 
X-CRM114-Status: UNSURE (   6.56  )
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


On Thu, 29 Jan 2026 10:24:04 +0800, Baochen Qiang wrote:
> ath12k hits timeout and memory leak when requesting firmware statistics,
> fix them.
> 
> 

Applied, thanks!

[1/2] wifi: ath12k: use correct pdev id when requesting firmware stats
      commit: 8f153eb745463b0715f1aad41e765cd83e9da8c0
[2/2] wifi: ath12k: fix station lookup failure when disconnecting from AP
      commit: 7259b1a0e54c2d3051ac8f1eb01de121b11118ea

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


