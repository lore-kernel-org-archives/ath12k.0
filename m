Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA37C55162
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=; b=KLJG+2lYLVDpAXvG3u+imLePZN
	gERUt8WLU1igkzeV/Z4HvNfUlrNPd/bYaudclkUy1+RwkwqqQuJndqZWFJXepdfGgZ97LQiyWYmeI
	XGJZrjw/WFna1YZnCVSDmRtFFhPNW7OFdPut/4amOftse+jvqKutMZpzOcwb3nZ9qItwcuCi/QWTJ
	lyA58DHzk4RR+92re6Iq9Gb1rACfC7ZzwHJW+YvhxzoCbciXXs/9rdl5wNHaI6Owbo/xTkGFV22nc
	/Y19OWTxIbGoJ7Yfe6nSQBWoSUk5BAtpl4enCCmOSXnPQk7Ij+eDk6MbUQth1PzgQCdI45og33Jql
	w/zpZE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSPX-0000000Aoji-2q9W;
	Thu, 30 Jul 2026 15:11:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSPV-0000000Aoj8-1zIn
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 15:11:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiowj924895
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 15:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=; b=VrAvbfaQF6j3Ic9F
	iUdFLk2e2RV8iT7Gta2FsU618Z6VjoEIhgcl6IzYrSjQzIg6m9Z7hfptvCLD0KTz
	hbEXM2jp8oWpMAUTmXnoOehqmZXFPfUkwn+IUXKd+827YnuyIwRfrS8t3uj9g2ip
	iD5dube1fkXvoTwTA8bhbLlj2W3PJbYMWs2aufCv0UEYJNux9HiBNyeZ1blydXif
	z+RGQJeXUZcIM9Jocy6v/KNg/fje+k8j0LSluk61ywsfrWbBahQ8Y/qxXc826YHn
	J+uPg7uzYvxZ+XS7c+QyltKXAW8llV/N6IMkSGhvCOVa7ceGRJLw1D7y5uEfDPWV
	MjsxQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n804us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 15:11:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so3200108a12.2
        for <ath12k@lists.infradead.org>; Thu, 30 Jul 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424260; x=1786029060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=;
        b=XnEb9R/CCFM8HinvfCUJz60RzvrUaMW37ScG1VMdu81K9cPvMbuMZa5k93u8Sa4BMW
         xSP9apwD2KFParp7AHrDaWDjR+aa7xNnA46j3B5kLPOO0g3RMSJr692/6eVWDUIrexHc
         ilZcOAR3ZTbGDelLfRib5/RRvI/ME4tYtyDnrkTaCxsfreVlJkYxJGtfl16CPjMBwGE1
         oCxou7GlGz7LiX4HdtAG7hvu3YbZWFSwX9DhsXBh9SxiNdcqe9PWMgC+Qv57bqmzrB0t
         4l+X4sGPRSHFralCXqoRmQOZ35C6zvPKzhGUDCJU5Wof8Atihz3mr2N15/w0SYG7nIEG
         pM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424260; x=1786029060;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=;
        b=Wl9PH+EAaAQRKMf86yUY0pjTRm9fko4PldzKpuQslCRFit5/LRXhNhbA3jfeujmp6d
         RA5DbeNk1b+S06X4JWpDOzGHmEcv5tu9sB7jIEI5ucUs/Mmu/4wRRLg8IZDMf+kDYn4V
         eJisltb2grwfts+NfCm248Nl9hqeHcJ5529iYElKW1dTDdo76GRpkh+dO4elH4c1Lso9
         5KI4JfgVdkq1QYNTRow/ew2djdyB6jNkLX0ohZI1fZEgBPGuA58VHmiLSRBHFSwu7zjv
         d4nlaD9dtE/WQF51wMr6DOtA3Rj/Vil4ArEgMCPnACOisWYQLu1UBpbPgh61bYtVBxQZ
         Du0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZsAmqFPIn/7Bw+sYpXLFH8V2x1+MXxwgttlhxu5GFO5IvsviyYpWIyCCqQTunECEbpamU7S4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzT9fgPAUY5XIjHOkz+fPdaDjPtQdrwFvxDy3Ka2VWJlJosRf85
	p9IXBGntcV5Z5G15kxPLQ6XzHJM37gLBeV/QSPr651Wlrv0wLicZWGrHlUsdg1Ev6ro+eCY5mFc
	PwWmWep9p4/TSdsjHLU9Vt6BI0kYOrNO3T8cqDntiWc/BR8sTTVp45AqhUkt2kR7J
X-Gm-Gg: AR+sD12tYLpROO1zpzZXvZTDZ9lulKr/5ON/y9oYbkezUMD0pz+69v56VdFETaw+Vi/
	qNwQTiD76yvRZ9X+4ZsvJlHhpfofQw8qM9CtpLkOuo/rRD6v+odYorbtAQdjpSzZjx7ZW3IM4wi
	QVdWZeaETTZDi21DWJRUMQzRDIs+JqB4ouhzX4QveEkQKMuVOBUuf8ro7e+hKOapk8eHM2Tbg4b
	Qr093/Ew2KWjXXfuEAD7x7G1q1AiPMa299ePYBTcGekQCPJcwoUk1n9w/ZmcMFbrAYzBJprYipC
	UHMKuMeR7VC9u8rqA8MIPdAzHraAIxZA6TcMS4VaL7hUCsm5cEmqFedBqu6SVwbw2RfXcIWgWeC
	cEV2oTnDluCXJyJayN6fvAY7WaH+J/2lUaAPbJwNWWUQrJGo0jbCQLCQ=
X-Received: by 2002:a05:6a21:178a:b0:3c3:68a5:50c8 with SMTP id adf61e73a8af0-3c90d6e9458mr754408637.71.1785424260203;
        Thu, 30 Jul 2026 08:11:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:178a:b0:3c3:68a5:50c8 with SMTP id adf61e73a8af0-3c90d6e9458mr754381637.71.1785424259800;
        Thu, 30 Jul 2026 08:10:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm34502171c88.5.2026.07.30.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:10:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
Message-Id: <178542425857.3503956.13658873020140475290.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 08:10:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX+rJGvuMtXdMU
 KleMNUrY2NsQZGDhPP9unSN7sxSnLF9JEMB2/WWU4hh7U1znnfoZQyo9nWDvO6MHR7GdodeVDK6
 rJhp9zH+qkT9YI02NlI4UkmLNx6vuHxYwtGVDyNWBj/+fR1OpA4wLZcwMXVnXZWYrY1fQnSl+mz
 JmBzTCAjD0Fe0noDlfQWGfL5hidU5McwelDJb/xWZGSxnqU6EOYLdIHYPtyF/rytYEKoPiPFC2t
 QcabDVDPRoentLpPyMIigzbDGuIXj2eCsC4HQ/QgKL5vUZlHwBxpr4t/12mgCkwYHvEl+Xc5vMs
 KwD0U+mHeLE1Sv+DBqgZVRUzY3eJK8cgKlhrcfqE/kZNsbjVF2Xv3TR8c99erLu+BHmqYSqFX7G
 ypYHjvAZJzEBZ/X+keBXljZ00UYYBo6Qn+/IMOb1cK5NRJlYjhwjJKd2p0TjM6jRayvk82x7vxa
 l6BDvEqRDU2DO2MPG0w==
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a6b6984 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QOL9NQ9GI3QxS5QxDNMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: IE9QJxvVhxViZXzVtOJ9IRFOdMb49ddk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX4XXxyJwiWIzM
 VtvtaxoYy93SdGiSpxxhFc5hy33/qhKcqeLuiKU0DubRveic0O90JcKSvvLR8oXU49H8mDgRLub
 8IrvTA+XLhyxoVCozKQNtJK3LHbq3Lg=
X-Proofpoint-GUID: IE9QJxvVhxViZXzVtOJ9IRFOdMb49ddk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_081101_539661_328AF6BC 
X-CRM114-Status: UNSURE (   8.14  )
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


On Tue, 28 Jul 2026 18:05:27 -0700, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 

Applied, thanks!

[1/2] wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      commit: 4c6eb712a91fa079be6f9f1419c96e0ad2227081
[2/2] wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
      commit: 7a246c72132eb943b5844ba79dad597b47429dba

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


