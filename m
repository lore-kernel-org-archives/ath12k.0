Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9B2C369D8
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzXvWSuMXJo3i3Dx5HwG70GJ2/0GhdEsmuFK+VMvuSk=; b=u4V8yyN3L7ngcnm/mjCvhBzAlG
	NqINN3Y/YoSANuC7kwsrckHgz4nv3ezxkQ5OkoV/AHUKWAzVD0YdI9jXz38M3cncagRlMfleJcpqo
	ouXkS9MijfD6e+ab7P/gDOZsgN9zSDrhNHKT4xeCmuKBeTBwOT8E2MR+PSZLUHYU0gaZNaYt2K6XO
	1bVnchMlGotztxiUVe9xb5eUkpCOWerJ0eDucC4FYxCXmU3aU/O+PzZ6oDgzKxTl9Ckt99QMnIuU2
	+ajAMruheAxX+E4GzpmuaAguDEOYQEKrdc7GzS1vd3nc24yiLmh9x27+lHmicF8J47sQrWt9CGlc3
	mISTYCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6K-0000000EemC-3cQE;
	Thu, 24 Apr 2025 16:07:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xYt-0000000ENaT-04FA
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 14:28:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3EtF016255
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 14:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzXvWSuMXJo3i3Dx5HwG70GJ2/0GhdEsmuFK+VMvuSk=; b=Ldnlpn29MgRhKr47
	REren3WGiwMD8VoGG9m57SpQf44wcul4XBdyfi123+LbJ50zu200zTdCj8Tw5EqP
	95k8lvKT+UlfBlfJoYDQDCctD50tAOQA70UzYorSvO0kjD551P9gK53v88Zk5BNS
	1IwffkE21h9Bg3Y3bysQ+7Ntduyr2lmzLqiRJGAwFviWDCCnY5+iukXuxGheKSlI
	sM8+cozm6O8mKZ+6wstmtKY0+11xm/AnCMQWX/bDoD9DTJM9PIv/bdsqT4WXwkfm
	QL9U1bJKQAQmje2OnrWfdAs4Un2c3Zu4fThbhJYqAwIsSsvHdKRE4N2gmw+TDDiE
	4xFHpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0dytr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 14:28:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223fd6e9408so13317185ad.1
        for <ath12k@lists.infradead.org>; Thu, 24 Apr 2025 07:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504901; x=1746109701;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzXvWSuMXJo3i3Dx5HwG70GJ2/0GhdEsmuFK+VMvuSk=;
        b=gZ4LcasKDPJH1zzY4RhPeiN21wisHvCOhtsMy8TgahXxwvmBNnuBfAQsSi5GWmjDTP
         YkivU45cz9W+w99fbscpOB4wP3EY94Njd8gTfPba+XWmwSey2TFEd/WXWBzKf+oBXck7
         uyAzmYSZworqBKm4lh7NoFb0jeQ8JAwk0Ft9GgGukXzGTcLGxnMOefLrrpkqnvnnF110
         o44otIWcMSyQkE0Hjac5QWh80cvnLE/vHusROuOmknLKvUwxabTxXbzl3ufH0V7Z+/yv
         W6rcFB6dTmkHR8O+NOCqPkketdLEWTM9dbof/6g97gxTbItwLlzA6618jY2W2F53KTOh
         i2Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWIwdAWPDnmcBdahwISNO6mV+aUoe9EpdogPxIkFi3Ry9FkEdDFu6ZGUGL5Wi0qXtgU6uxTwCE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB694yZsmfClaGXIhyfhMfvyB1rToxEC1ATcv3dl0fdbl0odjK
	GeVuw0C2T/7gY5Hd4wzknSS0sdBg4ozcXFRj8vat5DmOSBE6bUCfrQpDtjTUuvrdmi6j8MkgcNb
	vARsqjQMqlXfp5uxl7HrmbGKvYYy+d/owXQ+F+hSmZ6DQBUNg+6OSvB6CZmr3
X-Gm-Gg: ASbGnctr9T7OVyWqTki640KK/eaa1goNIJ959kaeLe6+lho/YB24rykM2F3GvkU2Bbq
	oXHJXHhFkg5Gs8rqsGe5HJbn3PeAqnsHOsRvnQshK6VTdF7GshyTDmmzobfo/9LgFxfm0eyKkWJ
	nuOu4hyH9ZXXuv1J/fGUNW2afW0MypMx8O2wVq0yQ9CIiRf1sT5c+GX/RLU93lum78h3luEKoFi
	g620RX3yJ04ekzo1J3FH1fjXjsZGkUEH6nmNTJ6/H/JUoPcm2vu9YRx/sk0awk9/6P/XjaS4ICO
	kTDxDRPPkWI7oTvqaY90owVgEXzq9PQ1BaseREpDislxon5VfRGf3Ubbd6iTfeDr4hlSPcWf37C
	j/trN
X-Received: by 2002:a17:903:f87:b0:223:4d5e:7592 with SMTP id d9443c01a7336-22db4996560mr37581845ad.21.1745504901274;
        Thu, 24 Apr 2025 07:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGHTtAQTLf+5cb4l3zVmCWrpdW66XnSUBOqWWE3cukQ0iQjHAIAHmaSu61S5BU53xie0Zdrw==
X-Received: by 2002:a17:903:f87:b0:223:4d5e:7592 with SMTP id d9443c01a7336-22db4996560mr37581425ad.21.1745504900888;
        Thu, 24 Apr 2025 07:28:20 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7636sm13978035ad.117.2025.04.24.07.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:28:20 -0700 (PDT)
Message-ID: <a5bceb0d-bc44-4bf8-b08f-b56b637b28d6@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 07:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: MLO not working in main/main-pending for NCM865 /
 WCM7850 in station mode
To: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>,
        ath12k@lists.infradead.org
References: <231C035E-18AD-4ABD-91A5-841253644C2B@gmail.com>
 <7001407B-8507-4CD8-B96A-328927D6E286@gmail.com>
 <FBF5892D-0A0A-4AF9-9D53-B3C76673D797@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <FBF5892D-0A0A-4AF9-9D53-B3C76673D797@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pUsWpCLljdjrDqLukc95-SIf1sUL8WTg
X-Proofpoint-ORIG-GUID: pUsWpCLljdjrDqLukc95-SIf1sUL8WTg
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a4a86 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=K_CAT_sY-I_QQhHSzlkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5NyBTYWx0ZWRfX61mf1umbbXht 5PwohnGHlvqpiTeIRDogy+RrHnyi+AGyu6PqJLHBdhEGGPrdB31u9Bz+0HHXYaxlzW8XKgfemxG wQ4G5Qr6WNlzDp6nNCRFgHipYThzdvecEEoVZR9U+RFt2aIY5ddL5CZrRYurNVeDC2OAlUXEZHv
 ORTHbdWP2y8v6ogydjW87OtWhzGFVuAEPbhDzxJ8MOCAWnv1DsJ9qhJWbTqej2a6x8SuQ1K9tDp XlBCHqOGLS5wafmzPCMdTTKSaHFpet+4cWSGGOvD7B3KvdUCJrVq8f0yoqtJk6MRFT28MQ+CBcE mBX0XsyRK0PgKqjGCCmjWy5TEsW0PHR3gjmO2oBxISUOdOrMyH2GBe6faYeHafJ7iTXmh9eehnk
 T/TLvBnRPvcraSx3vLFUSCrzUa2r9IUq0IB4rgfkKXrvebQqWje+DS1DhIkyYnOng0yMWba2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_072823_057246_67643B62 
X-CRM114-Status: UNSURE (   8.65  )
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

On 4/22/2025 10:35 PM, Benjamin Eggerstedt wrote:
> Hi,
> 
> I compiled main-pending from here https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=main-pending after "Merge branch 'pending' into main-pending ath-pending-202504182357 master-pending main-pending” by Jeff Johnson. I tried “main” the day before, but saw that a couple of additional fixes went in and redid the previously and unfortunately still unsuccessful test

Response from the development team is that the current public firmware is not
MLO capable. An updated firmware will be pushed soon.

/jeff

