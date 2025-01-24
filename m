Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC21C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHmAIxqURVXWtdtTWYEcXbv3gCxvkUyRVlPDzDmVyjk=; b=vI/r6vVBKBeozDkniXS6L/t7Fx
	hh404H6Lu0wdCB5aOoUM2Ast1r1YB9EPgm38S0iR/s//pFa6y++pox+L/4t6A3BU8MOp5cHOQrBxy
	1f/uxaS+yDkQBo5+8Bwe9RL8KMTUtYqz6MXTgmZ4qZnVaSQzmEEgo5Erm4Zqj9ULxUHNGEnFQdrAV
	u/yaWvpscEAxelzEd9ZsxWTXgNi3jjCqv7+mBxXEHYKFzvL5g9DlKCgQd/2l8QXNcU7GC57BJ5G25
	QJdkFf1ELNPe3djTtWfE2ONNUvui1NiPGjd3VjSkOkEFP6cDt7ToMmzoQ843vKATxqRmWMXmL0V48
	C/3ey0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbOXB-0000000FIzd-3B1U
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 18:36:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbOX8-0000000FIzG-3H2E
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 18:36:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAh9f5015972
	for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 18:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHmAIxqURVXWtdtTWYEcXbv3gCxvkUyRVlPDzDmVyjk=; b=oHodCmzgTliH4ghh
	1mhL0NjWEj9oV+k58d7KvuhIkaqs0wkgSveQHTB9ybWiGc4hw2vmAjfc4U8kQ70d
	U4G8dW/DVk/JKLM0bXB8i5pY3raGzXTCtdF1tm6FK8IdZI4CkioVgm9S8uCm2FVK
	9B36dxtXRb2UvGhVSA4CFP6VzBn9tpjXEAAsQFgBKOUVPgjWEQKJyKX4IpdTd/VZ
	jGp4f5ghMDjFB7o2h3oo9Esdy4z7Vq/vnCpSKl86XaF90RaTDBZ5ZZMIjGfrwYcl
	8Xx/zvoDE8Tn2paER7KpR1ZqcFD7BsHtH7C2zkLSxX18KopphnnP6Cyr4Yrm2lkY
	RPzwcg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9bt153u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 18:35:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2efa0eb9cfeso4944340a91.0
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 10:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737743756; x=1738348556;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHmAIxqURVXWtdtTWYEcXbv3gCxvkUyRVlPDzDmVyjk=;
        b=Ejpm14EG8SpEHXhFVr6jz4SeSg5cNbcDgA+fCUNL6pELO91aj3mDituVNOPktbP63h
         51m6TmvBWYa056CxDIBNzh/tOCfQwaC2s5JXs5+9qsaSODeQHMggZFehh8WAC766MPDn
         VbPa6vLoNN3OVDS2LAVqw8F+HrS7KlNJd9NfhHed0xITMOEWgUQsGu9MpI8LJua+tIie
         LZby0r19m6yhnbAVywRpMDkZy/CKWTW9oIfvHwFwoyGtaBkVAyT9rqVclacdgOtKIoRx
         oKnrDM7L+iDBNzgSB8YyVlhS1QbNzK/ST5xJITANlY6XLwiush6k0rSRBLNk11qCbzcy
         U6Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWcnDDZXs6uCvdqSwQ4Vz7NWvdGPTiq0uA7Cdr8UbCXmN2yzhPawuZ/6Xb+Y8r7z1FjvnLgck4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6YqiHN54gxhInSYr2+ZlKXdXY8w0jsTGbT8NizOIE8jk41xdy
	aNkVTw3FHbhKwyjR1HE5MRMiVlDKlA2jJY1pcVkQgPKDbQ7mTcqdCZqYgevoz/RymdD7rSnoPCb
	1ulXgtFU5i5ZtbL3cTxPnLrDBS3u1H5pZnJ4qX7Czq66v+EQRT60TyibdnpI4ktkDctVK
X-Gm-Gg: ASbGncsTmVV8QdGx/CMfRHd/7vEAnyLHNJvMARL++ztQpFcSvsJEi16o9CR3OasYqzL
	QPGmgkE+JYatDYul/rOgrU52S+ZqovymgpI4SMAQUB0OFWqup82I4ijjrelEAFwE4mBWaK3sCOa
	4nu7lTQ/X1M6QDz+d5lwDaPTCl3UW/lVhP3Ufk3DZB7fqk5rOqwOfG9oCqT5hFrimGjxxD6vrUb
	suwWHNLmp6KTaA8BQ2d6GaCCcZhLqTddIZ3QL27wD/7DeA9diedSvWotke7E9lOdgW69CXAtTuU
	SDsCFEEwPaPp/UPbPQf17Bf3brhAKz0=
X-Received: by 2002:a17:90a:e185:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-2f7f172999dmr14059615a91.1.1737743755971;
        Fri, 24 Jan 2025 10:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2A5sqwh+G2JHyQhuyZNUQRQ8vdz2Rq12cJrIzFyu4bBH6D0M7Vb1nVgglQOkkMw1p2+8+Sw==
X-Received: by 2002:a17:90a:e185:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-2f7f172999dmr14059586a91.1.1737743755629;
        Fri, 24 Jan 2025 10:35:55 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa83f8fsm2049632a91.49.2025.01.24.10.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 10:35:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250123-fix_6ghz_rules_handling-v1-1-d734bfa58ff4@oss.qualcomm.com>
References: <20250123-fix_6ghz_rules_handling-v1-1-d734bfa58ff4@oss.qualcomm.com>
Subject: Re: [PATCH for-current] wifi: ath12k: fix handling of 6 GHz rules
Message-Id: <173774375451.3015659.10376753884780529993.b4-ty@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 10:35:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: gVvctPCw9461JeVVaSdOYK7frmhhM5-e
X-Proofpoint-GUID: gVvctPCw9461JeVVaSdOYK7frmhhM5-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=844 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_103558_974126_BFFA6B9B 
X-CRM114-Status: GOOD (  10.92  )
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


On Thu, 23 Jan 2025 21:51:38 +0530, Aditya Kumar Singh wrote:
> In the US country code, to avoid including 6 GHz rules in the 5 GHz rules
> list, the number of 5 GHz rules is set to a default constant value of 4
> (REG_US_5G_NUM_REG_RULES). However, if there are more than 4 valid 5 GHz
> rules, the current logic will bypass the legitimate 6 GHz rules.
> 
> For example, if there are 5 valid 5 GHz rules and 1 valid 6 GHz rule, the
> current logic will only consider 4 of the 5 GHz rules, treating the last
> valid rule as a 6 GHz rule. Consequently, the actual 6 GHz rule is never
> processed, leading to the eventual disabling of 6 GHz channels.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix handling of 6 GHz rules
      commit: 64a1ba4072b34af1b76bf15fca5c2075b8cc4d64

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


