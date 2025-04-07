Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73089C369A4
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 22:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KscTYQy481PoZuE7Dp2EwtjkJkp0UdcKA2vsrikNWn0=; b=QXPZ/kXWx3DSJtkR6gacPsQ1MQ
	TIZaOeV0whsewS3wGPR/pWK7tLXQCh/niKfXMGN85tDr8gShoJSkauW7v8VwKBsqn/unstVFcFaqh
	BMIWd9UNnHIjzYzQrbTgXZXyfpwlgJRrePsQbEdE69A6kB2VXKYdrtqdolhk/2uEatw3IhBYJMuJb
	CYSJpmKoRIrlbfMmBSDEoWazV6Gap1rIdmv5TviIGzB5Opbeo0lRouDRwmPslQ5sj101EyqBMA+OD
	ydYCy+pRd6q0bMYlEKiaOLKBk9uJqSzEZh5t+jYTjrCx3jPTyEm5bJp1VWZHoBY+OpJ4MVYi2332n
	8Uy3YnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vPU-00000002EYS-0duX
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 22:57:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sLE-00000001r8E-3P1Q
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 19:41:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537IIrI4003269
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 19:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KscTYQy481PoZuE7Dp2EwtjkJkp0UdcKA2vsrikNWn0=; b=ciFGuBtjzEjnJlQZ
	PwAh98GDTEwJm/0grZ/7fnzsFdqlnGzXr/B/TMm3nD+Fp2Hz6MY2Rd0xmlCY/Kqf
	agD7OYeKbQgVrk669Xw83zBaFZ0OdQOLxAZ6t1TZ81EE9scoCm6hXOoJFEBoyqsW
	EKJ5tB/HXndYLABzXP2xXFbvwMNnd8R+ROtkHGya/OfyiNL8q9YxjVKTHN/STemr
	F+3jpAOOD2vHInnUaB5nhL94qjdwBL3NNDc5LquEs5sFuKDkY/vTNe515GtYbYm8
	F4NT3UG8Fl32BQEHT7kr3cXeSzoU6Jdjd5g2CRylfJGZdnGJg3djfDMHBjiq6jLv
	HttO5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftdag8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 19:41:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242ade807fso76153715ad.2
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 12:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054867; x=1744659667;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KscTYQy481PoZuE7Dp2EwtjkJkp0UdcKA2vsrikNWn0=;
        b=RexdvPiTwDeDq3os5iytm8nSPqUyWIeJc6i97NfRFgEQ49yfHctmCqeTCm7XR5gUfu
         rom+atBEnbF6wgpMmSP6ltL0pcVCERNKM4ZBjbiNEbWsJNr20dBJ8QvD9xx1iMnYBz2k
         rGxzcUOqaV3sK7uSR4UAPMbqMjr3pRnGOwCaQUHxPcsUiQjnw0bUyczcNfPA1CZQpYH4
         L0rw3TMjMOuFE1OjZumVycZqA0iIpM+XxF7p4MEqNBWH8wQ+cWL1yl7NPHq8h216bEvS
         iI2vlBI1w2pupWbKnnHlfehWKXDVlusAMkI43ezQfdbulUGWLGEPqTQp66wCODQJO55/
         QWlA==
X-Forwarded-Encrypted: i=1; AJvYcCXSRrLXuhXr0+hyqR7/f6X1nZWOcMKNlZ9BRyjZ8qTx89btvppBDHgGCYY5bZrLqeoVPHj43WE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/feNOQzWOmqI042cXLRY/OA0hXCNQOyOvqTyW0jN+D6SzVN+A
	zS5WAeDS+dUA63A8WblnRgJbSrIh9TOJXhUJhSMSNCcn4dK+ZKznfUBw5y2tC+d2d+WCOlboEoi
	kDzhRaM53At2i4pbkGv3ujCXNk90YPCVpIobOUWQLqgrUKur8sTZLPS6TSRO2
X-Gm-Gg: ASbGncsX7d1o9zZJvucQ2h8urKfJQS6Lo7JnEO/jpyxHbiuB7mTE9od5uv487/DST0e
	kSwEWOk11YYG8bqOlm1XqVG/VuxT7ClW0360ASarBUZO25x6P3pn5GvN3DOoc8aEDGVUICCWx6a
	tpi3pkWj35PljKBanEnVU4h5Z5Iq8e2iryVHFZvAr5ei6QuXFyLn0RfGPUnxzZeDynEsD0XsFHj
	1iDOFwLWUvwPCgA8/4DKKikGdyIxfBCRuNzTOmDNl3aVtSDZH6XPph71fgk3XypCX9VAJ+rE3aJ
	neIGtDis4bYKR4FYxOEu6arOcFHSRcJiI3VYml2N/VGwC9jjH+aV
X-Received: by 2002:a17:902:ea06:b0:220:e655:d77 with SMTP id d9443c01a7336-22a8a8b80d0mr159882735ad.36.1744054867163;
        Mon, 07 Apr 2025 12:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmGHIXWQeBBp1gmPxy3r2HeeVJ9kG9fvZKoCvwdCeWI7S9RPL6SmBh4Nrj+lTZnGTwahoMYQ==
X-Received: by 2002:a17:902:ea06:b0:220:e655:d77 with SMTP id d9443c01a7336-22a8a8b80d0mr159882535ad.36.1744054866792;
        Mon, 07 Apr 2025 12:41:06 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e6fdsm84822225ad.165.2025.04.07.12.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:41:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250407-upto-v1-1-23ca65f2ccdf@oss.qualcomm.com>
References: <20250407-upto-v1-1-23ca65f2ccdf@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: Fix misspelling "upto" in dp.c
Message-Id: <174405486612.2865585.8066461311855235164.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:41:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f42a54 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=iowja3EhBKiS3qvbEMEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8L2z_MG97NFya8DeyEHcA81tTZyomWgZ
X-Proofpoint-ORIG-GUID: 8L2z_MG97NFya8DeyEHcA81tTZyomWgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=741
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_124108_858824_03B6DFC9 
X-CRM114-Status: UNSURE (   8.92  )
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


On Mon, 07 Apr 2025 11:28:26 -0700, Jeff Johnson wrote:
> ath12k-check is flagging:
> 
> drivers/net/wireless/ath/ath12k/dp.c:1656: 'upto' may be misspelled - perhaps 'up to'?
> 
> Replace "upto" with "up to" and split the comment line so that it
> doesn't exceed 80 columns.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix misspelling "upto" in dp.c
      commit: 68218fa0862aaa8fcc5f968663efc781eb4c91df

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


