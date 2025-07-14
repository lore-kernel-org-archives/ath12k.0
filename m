Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980FCC83F1B
	for <ath12k@archiver.kernel.org>; Mon, 14 Jul 2025 17:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw40OLZb8DmaHdUuMAQhKLnxkhsuaJHUAZeS8EQfAkk=; b=KrCI2Y8qHtSWtgPbfApk+ln7xS
	w0SzcaQADV0vI/i5RuPGR8rW1bJ5Jr7fFRbbSJnj8Fl236LiFXvgs+sahFQi8TUQRStXcv4y9B8aA
	kHYxIANP/9C45xO3tthyJ0jEVnGbtaHAk3nyAEjYANMUbB+WnXp660GszNc4gC24+tEByDt19w3kk
	WJ+2KOOIc9YjxGDyM0km2Kv9JX1PqPLVXUrgm4kHhIrsCz2gZMvJquQLrR8ZumCeiSd3D+SQIQi9P
	Z/ilI9GEFsGCOghkj7lOVdzLJrsKDTh7oJBnjuGA4KE8zPcc3YBE/cl7GDCqqG9bBqclIKW2wLkNX
	+6WhUa0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubNBy-00000002zVO-1NyM;
	Mon, 14 Jul 2025 17:42:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLmf-00000002nhr-3w9r
	for ath12k@lists.infradead.org;
	Mon, 14 Jul 2025 16:12:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ECEQ3H000324
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 16:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw40OLZb8DmaHdUuMAQhKLnxkhsuaJHUAZeS8EQfAkk=; b=Vz598LLg5T4K89dh
	en+r6xuPOq8LGBQ657HaIjEUigyePNIRFbrskpaxj+LbLlTwC3WeRsIoA9SatYZE
	FPGEWAgR57mTCABQJBK2uNZo2TVxr1rmy+m04o+XkDx6jwxk2X8AvxA2OD0UmHzH
	TKtV/K+lfLIVH2hmZg31cp9miR/1gvJR1i5MoCjj4A2pwujDKIGzXFw3AXXty5El
	uxtzoyZXOiaMdZe27W0mcHanPb73bhdefxKlLQJlWmA6slKy7uPIzu/nqj3aZ9JW
	D+SUVYsW4vJG6Nyi/N8Qfb/3W0QURisiRP6tRoRVEFJyu+cVtE8ta4X4VSVhraaw
	OWrxxw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvay1vn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 16:11:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce55d33so68119535ad.0
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 09:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509508; x=1753114308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rw40OLZb8DmaHdUuMAQhKLnxkhsuaJHUAZeS8EQfAkk=;
        b=fi3vWywML4T0GRM0YQXmLb8IMyqzDJyyzY46JNAaZ+tgSC/IgYVRg0171XeJBNoaf5
         2fNJcfTkV+sghKjzI45mFUnblHtIi4TfgmTDRGWRhQGIHnXQSnF9icxEuizxvVG5Thv1
         rueoYYAWwLgQ4PRpPP10NrXpqXw5jAOCXVosYkomhg6GDRt6y2TYHHtMMIg5gpFUBgka
         WSKIa6AEjNif+WtbBT31QxYqYVeitbGKhzZI7KoSJeUdW95UgrOfCQOwDCPCaas2kAUA
         p98J+bSwvGESdAA5zsmUiaCJ2WYPOQVHNGEezyG8Bdt06UJ85/smrK+LnG0hkgUFMOOz
         upkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH6uNIGxZdEqEPb3e88XAukRkD8CN4zHwKwM8HkAN01MQXZ5qFEId4v+ibjPMcXWp0zOWquTI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc3Pcg0t7JB9xI3cdc/wtdHnyZUNuPAtfeWUiOBhdqZWLSAvXS
	2VELDl71P33iPBqulC6hVaBRyg+6jdnMZnDFfQVCPZqr8e2pcJ+j5gerSET9pkZsKkJWLpw/Pa2
	+nxz8oPqaV3pjqLxMaoFisXIAERYQytTJ3dV6OdwrRRUe6vwms0zcfM1MoMX+mAEI
X-Gm-Gg: ASbGncsXAX5qYa+tkjs9eJoJb2tq5/P+Q5jTVvlqOZMmuKxAnBv3byBtXLUW/p0ww56
	DXzZHEvUrFOe1YgVBoOIEA/qYAUHmGzqHScvbKfopSAC5+drOluBafwvyAZhRTAEyVRKJhWrNMo
	+5gDMPoJzm6vT7UbtY0h7DaYMG6qOVxTdR8liRWhZz/8HFZRcP1bk2GtbaqRVHA3ac5kCj9BOTQ
	u+7lnIxiH9keJmVoybJXKZ907ylJR6QrwRYr/BXqEHBSTNcQAVxjvpRb/AxMXxagEbdGpfWStsO
	VfJoLeFqd7yUB5fqomOcFzxwapG5Ir/vLa7fRz3pKlUcDhl+by/SuSq3hIA3Tqq+N2y0bU2DZUF
	lJzZ+qC8c/InDkTOmTWU=
X-Received: by 2002:a17:902:8b8b:b0:238:f2a:8893 with SMTP id d9443c01a7336-23dede984b9mr126994495ad.42.1752509508224;
        Mon, 14 Jul 2025 09:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhQER9vRAE25eTuAqmHDTfAWwBwxOI0u3/MNS+rhHXQILJw2sqscUlvRSowDfnOj2v7faYeQ==
X-Received: by 2002:a17:902:8b8b:b0:238:f2a:8893 with SMTP id d9443c01a7336-23dede984b9mr126994205ad.42.1752509507750;
        Mon, 14 Jul 2025 09:11:47 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43227b7sm93757965ad.106.2025.07.14.09.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 09:11:47 -0700 (PDT)
Message-ID: <c2870627-536d-4680-9fbd-1c4f5fea6d2c@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 09:11:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Use HTT_TCL_METADATA_VER_V1 in FTM
 mode
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250711035420.1509029-1-aaradhana.sahu@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250711035420.1509029-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kcq7pA_L9rB6wtYbXlDOZ49foLHN1l-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5OCBTYWx0ZWRfXyklU4qJtJvfd
 d7bocldSZe/j6hfnditSYVjT5NSV5kRtEorhZBWr6CfVpbgMmlpplmm0IJ1+v4G7FsVq+qQWQMf
 XHEN3IwO2qHwWJbCkMfVi0FMY5rJSEv8RrzN9dgImY3dQk1JTNJFzPtGKBhf0f3IovAvR2X7iFV
 U4s4fUkbiy8AbWK5cG8ea0E2YWsR2c+eQbUoX66KNYi1Y6V6rz1AcmTpKpHBOKKFz2mLByc9cRq
 RpyK67Wo+qCEoVSSgO0VqY0OrtVXr2EID0o6Fs30e0IQWdARh/634nBjyXmUVYwPt0SVDSRhI5k
 ihUVuLzf7vw/7o354bbQaOYulXVR2ThsOj+5EnGcPx+4ThHKqb4EZBZx1r6n7NpLxzEpZL2nIyg
 qNWCrIyhuKllFbwHAudC2z72dL6/LPV7LOmrOiWgxWCXu1nATBPVO/F7LnNhjCJqi1mmwRwp
X-Authority-Analysis: v=2.4 cv=GNIIEvNK c=1 sm=1 tr=0 ts=68752c4d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=D0RHpJgxHeOTfRx_DPgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Kcq7pA_L9rB6wtYbXlDOZ49foLHN1l-n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=949 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_091206_176100_DA492CE0 
X-CRM114-Status: UNSURE (   8.27  )
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

On 7/10/2025 8:54 PM, Aaradhana Sahu wrote:
>  };
>  
>  #define HTT_VER_REQ_INFO_MSG_ID		GENMASK(7, 0)
> +#define HTT_OPTION_TCL_METADATA_VER_V1 1

use tab for value alignment to match other macros

i'll fix this in the 'pending' branch

>  #define HTT_OPTION_TCL_METADATA_VER_V2	2
>  #define HTT_OPTION_TAG			GENMASK(7, 0)
>  #define HTT_OPTION_LEN			GENMASK(15, 8)

