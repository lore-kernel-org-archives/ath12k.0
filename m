Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571D8C02182
	for <ath12k@archiver.kernel.org>; Sat, 25 Jan 2025 04:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/f+uBqE3qcvW351dPMd1CvKq4gspazuDatXFeQqMn8=; b=1fSmEt38I806ZMdtwVZo2RjnL0
	vHE9V9FawIr/Dut/txRcpGiWzfZ2ycFnGDnwgM9/7Uv/tkiox5JW1sLzEYJKzXesJf6hNHsY4zG+f
	nxCy+VR88RZYOxPvDl2g2UsjmTyg6cgiAyxw5C45j6NIAktTriZ4SUumeSb0TFt7cfvTJPEfQJ65V
	u52qBaKGsuDaWnyhVrtmj09x5A2Sv1u6lggi+faboxCXyJrXTrtBGRQUyFqD3yN1FIQ3L27toRvn8
	IY7grEOs/FaYor38MILtBnqXcM8NUdrpy1OjxQeGKD2UbSpOrmcv/lCkieFED6hCMO1Q0H/CE/EW7
	LgUGf5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYCi-0000000G0vZ-2b6w
	for ath12k@archiver.kernel.org;
	Sat, 25 Jan 2025 04:55:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbYCf-0000000G0vE-2gQj
	for ath12k@lists.infradead.org;
	Sat, 25 Jan 2025 04:55:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50P4lCrE010477
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 04:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/f+uBqE3qcvW351dPMd1CvKq4gspazuDatXFeQqMn8=; b=m0URK9qC+ZimcX3x
	Cwh8GCKYMsCiXPYwRuipHoAUxCEvySPlvklpswAyYMiHBdJnPW5/igCJRVIRlqkM
	Nt29jY+DKjsX7BsTkuLcWdM5x7rrY71T2J+Z/ELvpHxaLARnbPSfz5+9CW5dfc/6
	wkelHv5MA2e810eq5t/uZVybY28cK7OaG0yC8eNOmcUcRB+gPPsHPg+mPjWTtukH
	VRy7QbfJRyIeRihxKFMwSZpy2c/FXfAulwtA3ntbA9UpDwm7OXRj3W0Hy5J3Wan/
	KrMsCG0RidsOnrEsU0wDKifqBuAm+idwwFTch/P7ecJnCJdU+ZHulESm0roPt0ak
	Xoo/cA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cs27g0kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 25 Jan 2025 04:55:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2167141e00eso58534185ad.2
        for <ath12k@lists.infradead.org>; Fri, 24 Jan 2025 20:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737780926; x=1738385726;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/f+uBqE3qcvW351dPMd1CvKq4gspazuDatXFeQqMn8=;
        b=AzuhcriaJxBZUZDvmWKX/rCjGPT3XPTuhXR37782xPvfbBGYd7aSoXnYb+/Mww58iA
         LvrLkaSibD7Jn26UVFOEeo9XmBHSrizOmL0CJTmb5pqwvqRU180YwH4mqz7qqjciIO+/
         kZuRvDIws0FbaBbkqzs2kYyNBTR+uB+SjoP+3Qopo3LD+C/WDUzs36Ix5kB1lnnro78D
         zPRlCsGbJ1k9ZEpbm+mPkbgJ9uxhR0nd4CSktoJHnMJmksL61WSagQ65Ti9Sj52pya75
         wP4Le6eI8AgYX03XA55yhHGE/LKd/rG+1vode2aUghgGD9nQ76GnTqHuBkbru1GlLx84
         /hrg==
X-Forwarded-Encrypted: i=1; AJvYcCVT6B3YfPHW3/X1VCwqpApCjE41RSCehOE96ME9pzWuobf6/gq1PYzdf6WqkeRXQggBYeccQo8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOtzh2O8T+jMBODGqOF7NgeegPHX+ORfU5DgPw5qRewY+1Vr21
	kK5SydA+MvAFFzdZRLbVXKFRybkuR9Ss6vlpiMVGOUZw2ikRjznseP1aIGfucweTMC14eah87nW
	PBm3Dcs4xmoSBR02eNE6aFh3E5EQHBRNpilr+UtPeOoo0XTJ14KQteg1PEoca
X-Gm-Gg: ASbGncvG0EPfXQIkZCVv7WseuByd81zaWByZejkuFmEnvOEAgqKHJTRgSdvXT/fJGuU
	4+Da0BWXYWNegIn/W++T1lQn1WqOVpa9r4SH/U/pEy72E6TGuiTPNvDWNvU4o7aggtdeNAHvJBl
	N0pOShgCeunWOQT1y2HmATBfSSI6loWozCgE1PtJ0Ztf0AwYGHN05GAcoNeJkNDhmiYrNexZbPq
	sXnx3Gk8BKts+FuJXmR+0PjDAP4Jz5bjjSMofrevdawVy4J+d8buhLOkPiEgwfzpb2WDoZ3Bvpv
	DQyO2i4yq7a/jDjOPAPZVXgr5eVZ4GLAkfjD3SNgwQ==
X-Received: by 2002:a17:902:cec6:b0:216:5568:38c9 with SMTP id d9443c01a7336-21c35574ee8mr472207365ad.31.1737780926510;
        Fri, 24 Jan 2025 20:55:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjdiFhmKFZp+U7E0Nyrmz/UCSRKHVShQT1wvEl4yXVJ9h9Bbe/4DnM4EJRsKFjn8Wbq8DKcQ==
X-Received: by 2002:a17:902:cec6:b0:216:5568:38c9 with SMTP id d9443c01a7336-21c35574ee8mr472207205ad.31.1737780926076;
        Fri, 24 Jan 2025 20:55:26 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414db2asm24396635ad.169.2025.01.24.20.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 20:55:25 -0800 (PST)
Message-ID: <dd37c366-21f5-470b-9d4c-24ae2808c4bd@oss.qualcomm.com>
Date: Sat, 25 Jan 2025 10:25:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] wifi: ath12k: Avoid napi_sync before napi_enable
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
References: <20250124090058.3194299-1-quic_tamizhr@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250124090058.3194299-1-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xGEHFHvQLLbqkPf55R_-kxQCGhVOqlOg
X-Proofpoint-ORIG-GUID: xGEHFHvQLLbqkPf55R_-kxQCGhVOqlOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-25_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501250030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_205529_696932_B9D615AD 
X-CRM114-Status: GOOD (  10.94  )
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

On 1/24/25 14:30, Tamizh Chelvam Raja wrote:
> From: Avula Sri Charan <quic_asrichar@quicinc.com>
> 
> In case of MHI error a reset work will be queued
> which will try napi_disable after napi_synchronize.

nit: always better to refer function name with () at end. I guess Jeff 
can fix in pending?

> 
> As the napi will be only enabled after qmi_firmware_ready
> event trying napi_synchronize before napi_enable will
> result in indefinite sleep in case of a firmware crash
> in QMI init sequence.
> 
> To avoid this introduce napi_enabled flag to check
> if napi is enabled or not before calling napi_synchronize.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Avula Sri Charan <quic_asrichar@quicinc.com>
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

