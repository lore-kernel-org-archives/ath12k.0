Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3691C3ABD8
	for <ath12k@archiver.kernel.org>; Wed, 14 May 2025 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ubla14EFZ75kAo6reUTBKgpqY8L7jrsDmwk3M6LY9Qw=; b=PtRNQM4Qbkp4MauTBS/hCU88VZ
	S50Y5k90mSmpgz6OgTs8fKP1sM3zIrIYcw35d0CTDR0/xgRyO6PAbF1pdZqOZ9LfMDv8WBBt8Bshv
	a/9Sw8jJmOzvPKdgMyOvknCEk+51ePqjC52MTN4GLu39m0ZXkb8ONsm68Cp6pPEmbuD/shL7Lp72X
	4n4fk7DqsHT2D5G86AbMWXOyXyl3//DtL0I8XjK9J60V9ZgEUrBdESfUj5afrfL5fQMaYgkleOGmb
	1/TtJFmHkswg+Rz4NphzJcG+RurVCwtmZK7fwG3YJ6WpqdeIJkwED+h6ptYakGSFNDySAUWIVrV95
	5htG25rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEp9-0000000FirC-1YfH;
	Wed, 14 May 2025 16:19:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDUr-0000000FU6L-2Jza
	for ath12k@lists.infradead.org;
	Wed, 14 May 2025 14:54:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAvL4t003537
	for <ath12k@lists.infradead.org>; Wed, 14 May 2025 14:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ubla14EFZ75kAo6reUTBKgpqY8L7jrsDmwk3M6LY9Qw=; b=gVZraC9fkrMNsYwv
	XB+C+SrbMJm62vcw0DIIMWZVHZMWnSnYoSuM8mq9DhQDfm11vUdx8jRbh4glulOO
	NBO3WBFo95xiMruE+dWSApUZrfw3LUVsSgGOBBG8SmF+riuBv78PiftfBBQvD/d5
	uLTsj5nkRK2rHPW58Z4ZdtEMry2T9RPdPfEdpzWSrivJFcKXyF3RC40cq2uUPSeQ
	GAOnVfAtBzFmerJZCNaYMGU5GCOXqKk32mMJrpGMwJM9HKYT5vh6sc/cC5Zb9CGc
	oACUAlLdR0hN6aWEWvxq5cC9HPoUFvKs4f0UKZzeXMMaFw4aNiT+MkqTIZnSVe6V
	nzXBEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrb0ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 May 2025 14:54:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e7f041997so106390825ad.3
        for <ath12k@lists.infradead.org>; Wed, 14 May 2025 07:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234451; x=1747839251;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubla14EFZ75kAo6reUTBKgpqY8L7jrsDmwk3M6LY9Qw=;
        b=dwRn6u37nZSw9FCWiJ3skfXOIGXNdLWNbu2tgm/4enK6coTVXRi+1Uk1yqe+kgvJ5/
         2M4JuVfGSoaZ6WTqX7wX+WDIMGk4u0Dl50aEYtCQt4UOxVHFFDKCnoJWi+9dMcggJMgd
         YNDHY9vlH1+9Z1iGxjlJXnhI9D9CooUcvLFQKp+Dr/P45RFckytJOx2xI9T7mC37rYkD
         al1lFAszZZAIvPtfIpNAD5LQwKEi9/tjeQuk3+eJ25MWoc29joMYAEnHAxyEMX/kinLm
         bhwz6eJ27OUMI9NAlNEZJYDWzR12Nlhgya4FyCbJRhVlRK3zOANiHkyIZM4jgY/Lohke
         V+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWfwA3tzNziHFrfxrMXc1xE1EZH2+zFNgx0TuswmzUnpVy3a1SZTck/Z5jU1s9lesMLLLNAr+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMEIjVtlvH5oWdW6XwdhZBnZ4HZFQ0/3wmn4QQQAAL86F7j1o4
	j6YHMUPwj6OxR6+nH9fqGbzkighg3q8PkzxwvBnlsRZ8Ty3w6+sDpyY767Elm5XQ31hD1oqhDic
	9xV6vvcgc3s+gR5BjzrLIiW0u85YF01NMhVlLLfrSaI7oxb4oJFk096i3B8MH
X-Gm-Gg: ASbGncuwED1rzlQpxqNeYy2fipIBfM2UYoHp3nhfNJdv9CA5hT8EtkoyxMc56xuYrXl
	3pLDl3Z8rx5maX/fBV1n4uc98Io+pJYH/WxdEnWKxQ0BPT9f/OhLBHRwsJuu0Dhst7oD0m7d5uj
	zKd2VrRnZw3hbEyY1HdLkssoNQOn+Opu/wGrHM8H/LT3A7vmFr6x2no+mN8y5TIN45S+tyIphA6
	bu+8eV2tkc33Ju4NxmwsM7ViIVK9U0LJbfXMsbGeCNOuRE9yNxWgF6rEcPeJ9cvdZIQabLunhad
	3dp5LOTabGYpTTpcQPVdWYcWWW8G2wWV7cTgx6X3o6RzocFsIzTLkZrHITMUqI0qF1s=
X-Received: by 2002:a17:903:249:b0:22f:b6cc:421e with SMTP id d9443c01a7336-231980e9ee0mr46371315ad.26.1747234451128;
        Wed, 14 May 2025 07:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf51n5xxel4Kkz+hXWn3/vNgrHbBHm9zcFw/64vGwwR6SqqOIfA2MvUphdORO3KOUUfVWlrg==
X-Received: by 2002:a17:903:249:b0:22f:b6cc:421e with SMTP id d9443c01a7336-231980e9ee0mr46370985ad.26.1747234450708;
        Wed, 14 May 2025 07:54:10 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7540c8csm101163475ad.5.2025.05.14.07.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:54:10 -0700 (PDT)
Message-ID: <5d61a6b8-e259-4683-94a8-911dcf2b9e81@oss.qualcomm.com>
Date: Wed, 14 May 2025 07:54:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
 <20250418174818.3336510-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250418174818.3336510-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: g8DPf9JWsvM5TreFKsMkTzdiLIgmRVkA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEzMyBTYWx0ZWRfX89go+fCgvWGc
 mFqf/hM+wa2kEaOPkln5eUrLO/TP43ux/SvUOJfmod1YEIFNaI1c/n4U6MbCrnKMJW3LM1CwNrd
 6xeufi7I5Ze9PUEDhokukrvj1XyIAC2DLAOo7iASJoGc7OQV+jbCFhs4zetwSRJT4Z0XT3sSm3R
 0ymoD437dB8ZaeOgrBAtsSCRcw2Po7km5iZ979ay3+aqGsxb2r/kN42qHqquz89nlwJrkhttWfz
 63fqTlp30t5RNQrbOrbziCUrtM7eManCYlPk8ar6McsrAWldKZHoBJOYZDQb3t9NOZ8ARHzXqmz
 kRN9jcIFTzDa9IGDW11yc2NFKXztB+VDELF/9L8Sv3bl+/n2TouaWw4lIQFyy+1aS5dakpdYB8P
 haEbpNISH1zil9aW5rO5J4TFF1n/X05RwDzG0mC6KHp/wk5uw8eLgG3Vvv96EQso3ja8IXDl
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824ae94 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=l8VUrehaPOb5hxZ9740A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: g8DPf9JWsvM5TreFKsMkTzdiLIgmRVkA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=989 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_075413_711750_8EA659C4 
X-CRM114-Status: UNSURE (   9.84  )
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

On 4/18/2025 10:48 AM, Pradeep Kumar Chitrapu wrote:
> Add support to set fixed HE rate/GI/LTF values using nl80211.
> Reuse parts of the existing code path already used for HT/VHT
> to implement the new helpers symmetrically, similar to how
> HT/VHT is handled.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

Internal testing revealed interop issues with this patch, so this series is
being dropped for now.


