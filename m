Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C48C5B543
	for <ath12k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iU8Te9v2e7dO4cRDhE2B48yNbmx+gn8TOOV1jRgY0E=; b=b+zZVJ3M5ECn1yIlQExhsK1ser
	tySs2/wPEJP8E4PPV1ScQ/PAOVWSzDCL5KD6Wo5Is5cXjKGaqcbHrCqzR7RoOCh5qXmLxtSNu50YV
	Cg96Rq+AXaXotXexWYJVImaYt/cC+U09+ujgr/rr89NtQrkREAbviXTn2aGDzY1KCttzv3iey0Us3
	QsQpfKNR/1f4+dfyifoZqk5PZB759F4z2v7F+FDg9jiVANGNsLBjOtOROVNScJaanc03HE2s/9DAR
	fIQCAYHwmKlo9oWsNRLSKi7A+OtpG4SKC+hHOdeRyBXFj3y6ILpkh1QLh6xqpBbayNLowvQbiMnrk
	NRPKoj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumG-00000001mQ3-2156;
	Sat, 07 Jun 2025 14:44:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumE-00000001mO0-24OP
	for ath12k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AtEqh028727
	for <ath12k@lists.infradead.org>; Sat, 7 Jun 2025 14:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4iU8Te9v2e7dO4cRDhE2B48yNbmx+gn8TOOV1jRgY0E=; b=RjboE1O2wQ2/k2CO
	CBz6ZxBjoxbC+ccEwE72EkFZwtwJnrKxs1VGOa0K4ZYUPbM79rKLIakPEjeJd8jo
	9EshUoKvRZckZgc+F52WLxUfXUXN/oBjlhTfLShcBZMe4INCxQVzMPHUPEzA8z67
	+ZY+YrCa1zWqW7b310RiUPgn/TnWDu4mLMIIO04WqhHoux8GFL1lOSU3MMxUJ/LV
	gLdIKsZaQ777JV383hdi5xW5DcyiUxMkWfKb6MxTmdiVtL1jasBFV8iMf2NColEd
	/s6v58jRlR5sMgiZ8ljtFuBnc+DTwhWFu/mQeY8WaaxlCEapZ0RrwMjS7x1Ie/RW
	NePaTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrgwh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 07 Jun 2025 14:44:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so26435005ad.1
        for <ath12k@lists.infradead.org>; Sat, 07 Jun 2025 07:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307444; x=1749912244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iU8Te9v2e7dO4cRDhE2B48yNbmx+gn8TOOV1jRgY0E=;
        b=X/Ck6TrWWcOImBt2kR8PGoPFw7fqXqexr4R6RGM3G3mY+4Zdkh8ekNBn1KoGWPphr3
         BddLKi0aiRrwr4qM4IdMrHjxJXd9xySExpz2rZorcTaIB56UHozwpRm/6iqFdtQo0zNn
         jSz0xc2/nBKXHWfqqSQSI7R8jF5V7gWHV3sac+ORodsPbC5oiqpWzXSOPeOa+VCyZBQk
         Ou9J2uforVG7bRZ9BM6uHD664c0cGmop3Tl5YF+TThwvQCe204s1gQnWwGr2aE1f232M
         BD/U46QH92N0M667DtMl99uvgODDVQG9EZhmVCzm5s3DrjnELvgwxrDZmENfT0M/sGeS
         XdEw==
X-Forwarded-Encrypted: i=1; AJvYcCU+jFD7ckLy3c1cIC15pfCTYgpde4sJb/Ixxqty5PIxigifKGUh03YoKazH5lF3e6Byzr0flEs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvxoUPSD6Xfs9QkWW9o2kDQHz/LXVXzcTrNuZ8c/NvpQljOE3S
	Q8fYcz0tVfckDrSXO55Ivb64+pNWQ4HTZNtLE7G81iEC5xAw9Xhc45M0eskRwUuooTXTmzUu60Z
	6RoHwkPMqCBOSnxI1w7plc2hv3YwfH5m6ZsvyDsMKuVJcahIdhFVVnNsLL0oE3d0J
X-Gm-Gg: ASbGncuG0InWNA4Sa4DN5mSh+kR886icB9fRMSr7Hnn/hjuxqO1JoObSzy++Nn/wxHX
	F1tQcvBVcoLY8/O9BZ597dUhBwYXivpSNKEJn/JCykNo/+FhLwu3AghqjVXOMXe4fu1Y85KGOsw
	pKCikm3DIPiPXsEUUJuS51Ixdf0x0t0CEwUA9U6NWVzVbHz4zlZhq9IJgrkliPLUzFl6nBasDvV
	GPgXCPoQt7vsOswdr/ccqKZdt9JLg9ZtXCJzPG+XPBHcBbZsXzcVwLo3trpgcWsXQF0L1kM8Rqk
	E2/776xMh1SirQsitHFUunJhqyLjjALwvCgUzlreobk0z48Lt+4Akks+2ls=
X-Received: by 2002:a17:902:cece:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-2360207d144mr100448695ad.15.1749307444464;
        Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKUIj12Oorwr6eMwdlFcVN5kpcaOIa+5CYqOuw7TexiO57rHPLTcjS8SGWf1NRkYcWeiceg==
X-Received: by 2002:a17:902:cece:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-2360207d144mr100448475ad.15.1749307444096;
        Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:03 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com>
References: <20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix hal_reo_cmd_status
 kernel-doc
Message-Id: <174930744300.154748.1746628903090398734.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: F_Kcp02BygSIF5oDkGKxZGP_GmNKHke4
X-Proofpoint-GUID: F_Kcp02BygSIF5oDkGKxZGP_GmNKHke4
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=68445035 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=DsNapGL-N8PPGx-XoycA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX51WPjjxUp1Tk
 vUqJeeM3uJpvRD32Xarejgs8MI9dvbPp6ekxD0pSmv4qRfMGRcRvlOWQ+F+/5NEhmCGh2wTcrHA
 4k+WtF7Gq8DjzJei5fDtejUWYOPRnTZoNcNyiHo3hnqRy1yL7K9Byd/JFZKpfst3g7KgL82Ik4H
 wmZ+cOZljpyzYperzeJhtgsbXg8q4yaJ1J6DZtWj1jUDOL01BqRV1NJWAHYTuCsm+korhICul0p
 QxuI/WPbGzS63QhfMiYixai9vFnKSETS2JS2Oo0m1DDWNxUS1k6mlTDWrMrYWivgzd7PU29LLe8
 D86meDdgai04rQuYhnbvSNOrvDcB9ztksQNWoqCPveGMS9jvfpvZXWD5HdP2QBj4xVn647n6dEj
 /zpa8TH3EJrIKgPn1zUNQNKhoYR1Bb/EPAKvN95gcmeMGpJc4CNxFayy7Safwgumnj/QH+JO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=752 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074406_660335_40FE970C 
X-CRM114-Status: UNSURE (   8.72  )
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


On Thu, 05 Jun 2025 10:27:22 -0700, Jeff Johnson wrote:
> Currently a warning is reported when running:
> 
> % scripts/kernel-doc -Wall -Werror -none drivers/net/wireless/ath/ath12k/hal.h
> Warning: drivers/net/wireless/ath/ath12k/hal.h:596 Enum value 'HAL_REO_CMD_RESOURCE_BLOCKED' not described in enum 'hal_reo_cmd_status'
> 
> Add the missing description of HAL_REO_CMD_RESOURCE_BLOCKED.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
      commit: b6bca6d7149e0bc1a56e831af0296d45688945ec

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


