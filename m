Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE4F94CDB
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUHf8ulEiPw7CaBhxw+DUSr/H4AXtAj3Vn1bkVwKjM4=; b=1nROxmY0ggSZk8YnzJZN2GEdIE
	MVBOXrHC0BiF3LU7078O53/Gg4vO+5SKR9lZmFySbdZv+/X3yJx4wiTq7l58I82bgCxR+LCq/3C5X
	EnCHOcAMQxmYKySLcaFeEinTW354B/v+LR/TbUTdPt+s8movZbdCpqLnbyzEm1SZKEfcxqmmqknNv
	3oeajJdLFEOndTKCLunyOKYxOflxnESmQ1wtTkoT6dbZnHrgrnIKwHwRRG4aI0+MOYRQa8XW9C/M9
	QAAyCY/NfMk7hBmsNmwOVWWdeEWVNSKSqbtV3U22F4TkIqbHw20A27Z0LQbdE4/ieyUzGj3ex503O
	3cNz5Zhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFS5X-00000009jUR-3AYq;
	Wed, 22 Apr 2026 07:33:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFS5V-00000009jTy-2JqS
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 07:33:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M518bW3730835
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 07:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tUHf8ulEiPw7CaBhxw+DUSr/H4AXtAj3Vn1bkVwKjM4=; b=JN6QJcNPFGSKj+78
	XiCWi1bqDNVZWHSqDBDU+yezOJy7lMxooxtOpdjBPbcvbzPtjKnxRXHypSFI28JO
	NhO7T/lfPRkFsJLXGbV7c/Gwk9Ojv3gZkg2Lpbyswsj/lsqFfBQ5sZz2+DgnMDw0
	CTSF31oADr+O6R4yxcMI22jPLelQ31jd0/P37ihhXRbPyG97p2naCEJhb7gKI58W
	p0+3bjGWVLGB7M5grKGV4ASsFfURrigZ83jo9PX820rw4IC62Dt+tvNrnAiAogPS
	p/QtCT4ljmTh+TiNA1sSPYgmzJSkRjnu2NOM1TdFzDx/RmiLpsgEkItePBBBduIw
	pxch9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenft8a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 07:33:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4654f9bb6so54342305ad.2
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 00:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776843211; x=1777448011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUHf8ulEiPw7CaBhxw+DUSr/H4AXtAj3Vn1bkVwKjM4=;
        b=iMHRVxtH7yZdAqMZtViXlvQyyxM5q6otkFDbGbEbLgkckJfi12A2ORD5s2S5yQv7Gl
         2dzaK5TEgznOwwcvba2F8SLS/aWcUMisHTx7a2O4P/tfRv8jOq4g5BMVWvLyyvvNWRRb
         JnuvHq/bf+uOtbv1Cd060btqjLfii3xy0oVHCn3blFj4SUht0EDw9MqMFn0Tv5/f9lv0
         MMbeFpQjdTv44ue3KFu+bSJZ9+B2mXZC5ztddyD9GL5towsy8yrGEigx2azaDBPg09VC
         s8iPmWDz/cDqfiGnBE2CnYDhdYRosx4hOCvqG8mgQ+XnIlfKty4Cpcwu/oDPA65NCUxg
         3t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776843211; x=1777448011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUHf8ulEiPw7CaBhxw+DUSr/H4AXtAj3Vn1bkVwKjM4=;
        b=mkru1wKTQd3wGutSl1uHpambZQ0SHw/RM4XUNICn0M4Q/uzJAMKgwaZ0KWA3eU2cFA
         /MJvgu8aYAA5lkQ0kAauYyYQtFS9r1Y6AvOW5Jo9Ru3y/1TZflG8qeAJyVGh6MK+eskh
         Qz3tOlwm/1ruZUDCwNZAHMg+dLW9g9Rn4Ptonh3hiZLDvc3BdUIZrso7vFJ9MwvaX6z5
         7V5nPHXPxIUt0WAMEGCQZcewZ6EK8IJAcnrwsSnXGumQ7SBWvXmazOwtv1wW5Z/4v7PJ
         fsbESnZjKoMK6ssty4EQVpGhQku+kBlXzd1BCaEN/zNtuvy+yryNqOw6zsXRCTUVl9E9
         EBsw==
X-Forwarded-Encrypted: i=1; AFNElJ+wC7ZCx80J6oZhVcUZFnkZkFw0ZvwqYyy4/VJsaQZuww58MLK6whayEV5Tno12yeS8F8TetCY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVWrc7velMSHNa+wCLMAElAiAnsOCzHJ93ZrVv4bxGEZhlgl5x
	3lkKW+mj68Y8JRcZKY60eDiIofZIL/zT0OosT7IFyFhbJ7MvJQkr67uInm09UJmNTVIlbu+Hnhq
	yzBlaxS/dKG+SUDOSS1+3ZMjs7zW3tq5MfUHhbjOVXUn5JlVBS8Ulry3WESWN9g16aJVoFcz74E
	w=
X-Gm-Gg: AeBDietW33qvw/iDO5Ay78tAUF8+PqsxjcqnLNK38mP0wq2slKiJgf3FrJE1e39wU4p
	/vX97XH8ZTq/Da3+KXMnAArnUUT3PCpMqrag+52EAVu9OxLiwOLF9uRwGuqx8Vhyz9Nlf4wMpeX
	sqT+h6R6PpJn/2czzW6uugWTGLvMS7RbOhV4oDPGCdTeqP1EqXSDFyaPRdSi2XWDjmBGrR9KTzN
	FphuoVU3RYB/kz4pf0J/8SOyQaEdJpR/VzMVBg56tTssKGn6Te5uGSzRkkMMpXBtoZ/s1tpv9UA
	mVOCUELAi4esLhw9POF0XrLofn0fbiAkYjVIWKWuhVXm+B+pNvDFOuGzSlmvb2NgvQiinBB3Y2H
	TVHkzftm4KbUTQopSWVXFJk+gHxL/Rt3kvbO/pvaAGfsN1AW+M0msdF/0dPNJd0EhbIfeICo5
X-Received: by 2002:a17:903:3dad:b0:2b4:5dff:310f with SMTP id d9443c01a7336-2b5f9fcf868mr132251765ad.34.1776843210798;
        Wed, 22 Apr 2026 00:33:30 -0700 (PDT)
X-Received: by 2002:a17:903:3dad:b0:2b4:5dff:310f with SMTP id d9443c01a7336-2b5f9fcf868mr132251575ad.34.1776843210296;
        Wed, 22 Apr 2026 00:33:30 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff8d6sm148998515ad.1.2026.04.22.00.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:33:29 -0700 (PDT)
Message-ID: <48ec0ab3-96f7-449f-a1a5-d1e76a3cb139@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:03:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 ath-next] wifi: ath12k: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:QUALCOMM ATH12K WIRELESS DRIVER" <ath12k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260421213544.6238-1-rosenp@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260421213544.6238-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UjWPinXuFYeM-pvJgGpTkYbx7oU64Eg0
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e879cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA3MCBTYWx0ZWRfX0XgPD9c9Xs6F
 B7UDi1r8HWeA7R1txQnNVHbXH/2czuETW5wipWWzmyrQ4V33gJHckx6Terf9QRSqBxGFaoD2Uo4
 z1bkzN7u71faYP2hO0zLTAQOick01BCIHC3kyTpOXptt1YHrriQ5EIlFhtXbeQxd00PAkKRvkmI
 cT59riNjxKi70QbhuUubOIhlQpHf266Nt0irR9RwnoTPgmaZjaGdI/FMBAzESUp4WwKg7eJsyo1
 AJBW3B9rczrRvoP+jv/RV3agQDj980vVBnAjZ665kKDcdyHZ3nlbdnnOoryZWtlFnPoyaUfMSFm
 QIHmUHblWJV/IplxIZQ4cBXyf4LV6ffZAyGNftizS7MrWVYnhzMKJXcD94Kwou3DxF+9kTmlz8R
 870L5nj1aaH5RIMm8fR1bgbry1S10+oYpOdFnijl/7eZQl5NgaOVZ1wU3tiNxjFGzA94pXbgmSD
 5GxBNbSlHhrVz//2Zcw==
X-Proofpoint-ORIG-GUID: UjWPinXuFYeM-pvJgGpTkYbx7oU64Eg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_003333_713695_217508C6 
X-CRM114-Status: UNSURE (   7.91  )
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

On 4/22/2026 3:05 AM, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

