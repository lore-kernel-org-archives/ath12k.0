Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CB8C021B2
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT9XRwAJCHisYTwSXvGtOwYMsPC96fEtxsNMuiirINw=; b=NUpmpXpYtxMAx+waonH526dx8U
	UQKE5WWZRB+aVv5KWcIqNrH4vFG+nSDSmyvyr2E6Z6/LoY6IOkJe+AQ4SiLdIisg/vkHIdXGYB3Dp
	lrYc510U3kLxT6c7UwHu/C1Q5kySd27zJIPAFyoKw+cLSXbiJkZ1xxeQ2ji5NkmaR0gXaz4Ohp8I1
	r432MXq+wjanjgkA0rkUqg/MqtXlM18osUYBDRTrd4jK1O1souGtUBv9HPvYwtxO+Cbj8jcM97kZv
	V2+PT9NJQ4ygKLY6UyeMtJWKXzHHPHGE+5JzNgMiqMQrkv/Job++aPLljs+MZu/rbvbeBzsEy79Rp
	oEgEEXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlrKg-00000008GLW-2tdR
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 15:22:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlrKd-00000008GLB-3Wog
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 15:22:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51MAqAkw032623
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 15:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oT9XRwAJCHisYTwSXvGtOwYMsPC96fEtxsNMuiirINw=; b=fLqn5IacHZV/TWO/
	5N2iVh7YsItNZyQQqmoNCyBjEZQpG6VNFgBgDqudk/qAoLGdN05hnos1vR9onrkD
	QOvzXpedi0S0FZXcaMQCd8kz0lkzACvD04a49ywTvJsr0Q4cdpv3EWihfBaA4Ev+
	hl9iIQA8Tk23hYSbj/u1tyrpUbMfKbv6TBXFqZ8fZtXXpMJf1lzBBmKXUCvkijNq
	SuxQ2mVjxtyUSF+cKon7fakdVM9nQi1cFUsbTd+H65oFuBoNQZu7mgAokUKoA0pb
	XfJD07XBfAhZgsgWGS/2DX9obGzI/UrsI9SCyY3qmJH7I7OugPCYxps9fJZtP+Pm
	qnywug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wggx55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 15:22:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220d6018858so63294895ad.2
        for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 07:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740237737; x=1740842537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT9XRwAJCHisYTwSXvGtOwYMsPC96fEtxsNMuiirINw=;
        b=UZ8Z5yDbtIOfP/HL9JqNIzHVCpcFz/oZVEZ6p5kH/uCcg70bloB2rZzuzaDrnk+9O8
         7O41XJq+MQXJYXfvfJYk9tNMKL7RsCxHsMfq4P5GR+4NjcZnv8KfPCDXJwbrleRmrkLM
         hAj82TMg/XZbSe1VTHSvriRr9eazaY7T0lSKqq4+SL8EOJW9mSgTUGMqY0V0zJhd+fb8
         yJX3TTEqUcGlTC9/mhVMcgHvRLX7rbB0HHzMgNYgUoGcPOBtlKeBarD0haefO7Xp5mLl
         4WcPPipKNBpbdZ0ou5zmzVAE9efsca9WJyu8aNJBz2RR42aZKsymIv72RIj4I5tGNF1u
         IrZw==
X-Forwarded-Encrypted: i=1; AJvYcCV3T8Z0M9P6iDOVBbYHbs2dIMD927dGiq04l8rWDBIX4RHeEQenEnDcdt4I2bM0n1Jt7lLv0ng=@lists.infradead.org
X-Gm-Message-State: AOJu0YziJW1g/HZux/wOyXhigFqLpPiowp6K2+pq3MIGoa5swQ2FWtGy
	FYmc415Pu87tf7jkLeD+WMbAvLJP/Zqmjqu42G7yKUpfKkbATmTswF773D4xSjF5dDfjuaW6pfm
	SAJT1yfSzHV31SdE3MMeg+Cset3najuerK+y0F3zBR9KXQs3hp5NShONjQhLY4JTot504
X-Gm-Gg: ASbGncsL4CwEXfu9W/KUL/xDBvgdJignUZsaYFKDiXjhAzFuxShknu2nASg1aCGXdGv
	j6JNdmmAqrCCjo+tPsuUmBEcH5DKFu4tCk3Be96HX+XVk3kUTWLR4rsV8kHZ4/2rCJqxxdatJSM
	43uvOjojK0jvQutACfxplGL/gRVcZy5tKOgnR5Xmzz1+iwzAun8uqIE3j4S0MykfStCm/4SKsDj
	OO/zomQSWxgkyOLJOWPk7NGUU27TVD000ivIZS8ZupJvIpBCuNwbLOGtkeieslHoP3SKholYQJ3
	7CSPstC5s9xJuW2kd64G1/Dsg/WnUiyA6LBs4LMCUssgIZUlHy457TQP5NgF
X-Received: by 2002:a05:6a00:1742:b0:734:9cc:a6db with SMTP id d2e1a72fcca58-73426d94622mr12623531b3a.21.1740237737158;
        Sat, 22 Feb 2025 07:22:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUZtKhyQEVT6oGyT8ghRvgKaJoODpot5iWUwuwqMIIrOI+eBgB+iGndiLjjkG6MPkSo3c1Sw==
X-Received: by 2002:a05:6a00:1742:b0:734:9cc:a6db with SMTP id d2e1a72fcca58-73426d94622mr12623503b3a.21.1740237736790;
        Sat, 22 Feb 2025 07:22:16 -0800 (PST)
Received: from [192.168.225.142] ([157.46.94.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7340751558dsm6703120b3a.162.2025.02.22.07.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 07:22:16 -0800 (PST)
Message-ID: <c4bcf428-55ca-ec64-6c77-23e482839aa7@oss.qualcomm.com>
Date: Sat, 22 Feb 2025 20:52:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 9/9] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250222151926.379652-1-quic_periyasa@quicinc.com>
 <20250222151926.379652-10-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250222151926.379652-10-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zBOD8m2tqfSPYYcaz3hCqVh5hLr13vfq
X-Proofpoint-ORIG-GUID: zBOD8m2tqfSPYYcaz3hCqVh5hLr13vfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502220122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_072220_054395_297D2C9D 
X-CRM114-Status: UNSURE (   9.95  )
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



On 2/22/2025 8:49 PM, Karthikeyan Periyasamy wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, the monitor interface is not supported. To support the monitor
> interface, configure the monitor vdev state identifier, configure the HTT
> filter setup, subscribe the mac80211 NO_VIRTUAL_MONITOR feature and
> prevent monitor interface to transmit packet. Therefore, add these
> procedures to add monitor interface support and enable the monitor
> interface support on the QCN9274 platform through the hardware parameter.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

