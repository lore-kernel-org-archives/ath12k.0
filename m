Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C094FC02182
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q12StN78GmGHMNrsW44lEi88E9jEvFJprY3+7loId4Y=; b=mt212ttWfZDssMj5FzQlrkqxtx
	KSajD4DSN1A+X7YSL0PCiDKcb/ELWn0BmW542ejXJ+70MSHLUVQ5W2/scuw8o0JjovfBUcq+l8+7q
	MqmiVtHRUFA5+3A6/oHw5szrKX75upG0TksdsSXusEcktlz2VEtvFnY79zRab3NtCdFVWH1JLCjkG
	SrBGjA2uJgBVvuLXsf3G1HsbWNX3OFUOpfla0YUI8coFnGI+5JBtXsHUYOeHJ/+Pi+IGdqwA0ala1
	YlyRZa4If5oUoqU6l1YhxlBDOqQNj4So/JMHcDbkqOUa5rO83aOjOsCp1z1uNVVu5R0Og7IH90GUY
	qTmF2ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXms-00000009upT-2FZK
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 10:16:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXmp-00000009unX-2qzZ
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 10:16:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA3cXi003264
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 10:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q12StN78GmGHMNrsW44lEi88E9jEvFJprY3+7loId4Y=; b=RkbjwSwA4glAoTw3
	d31CqakrZjRu2BqHZLquLkL7OnjEugsTNMQGCfyRPdRsycraasS02XYuiHPy/HE8
	wfyGHqvndTSDEV0Z3RplY5nX6+tXSymUSh41zH65HAADkO+4qYCkil980GkhPb11
	iuN9YlSJ2tk0EtSepbwMm4Cf76J08gS8txq99Rmew+Lp4m9AcjGb0ou7UGVgjQZ5
	qZEDIL4yCDIp3492WtMfdGlusTyClPrmoEiwTg8qMT2G4rl/d3aTQCc5bIxPpUVo
	Ni11v0o7Av4LbzlBKCiihFhWfu1BpXfy15SHFKhuTUQnP2GIRBA8N4XhYjbYvLQf
	Vpd41g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44axkc0144-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 10:16:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so18506613a91.3
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 02:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540997; x=1738145797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q12StN78GmGHMNrsW44lEi88E9jEvFJprY3+7loId4Y=;
        b=qF/UQ9loh2e3klW9ZxC82dbAVIEei8MbRr15DUQlbsnlNAxzGPsfowQRBl00oQcDtT
         z8DwNdotdBC47XhYmK2OxYd9DgWHk7goVc5hiw7fJ6zmQaIhSiW+tUuDZF9H2Ge+2Msm
         /OoivAatbCcac0KvJZhGYIde+R34GQBZ4BgOBXRpwbA/demY7WHpG35E5TXv9QhZUGn0
         yAOnRNNm/54IvXU0CthzfHgzlIjfcVBUVppDOc27IEjIDtIXkKNdKl6pnnoIdMaNEB1f
         6oBoVrBVXIJGNcNgCdmyWUGJ7iy2rKtVhH3WNRhh16AbnXK37aIhEW47HWIW3OgMcXXs
         Kc+A==
X-Forwarded-Encrypted: i=1; AJvYcCXab3UOiCO/bTv84FNFDhfNJMmRkL40BHPmpj3UavhY+UB7/uSJAAaJ5mr40AQWtuMeH501UCQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6pJ/agLQBWbcFRtqe/8qvz8fT6vXyNz/MpbZjutIIKFJO2EH3
	RvEp/OMsDw2F4EappmQnlNOV8dosAo0JbP2mFR+ccgXsdVdjh8xlEw3ZgaNobwJTtdktUwGG7ww
	o50d+p+dVC9zRcmJ8zmskp4H9Q4qDKVepIwuqJ5SV+rYiBZQACdUvshbbzNV9
X-Gm-Gg: ASbGncvlvYrJUvEqbOw0VqKnasflU4wPLw+RxmyJuCk85Mf4EJ0NW0vLxBhsfCmosbE
	29V9yElwsY5TmdMAtxm5ZtdeBsbccJ1ojMLHBujB0pnG0h42iRQZwSkrWBurskvCxprYdPn0R2P
	YpXdA0Y2/WcDp/3x4nV22fEGt6tE70jEK4EieKu1XFDprM/K1p4jMM54AEzo+3uI1+cN8+RAhVX
	4unyxlIQs/xDHDT+bnFLiDwPD6iLWIa/c0VmPb4xZGXGiTXuVcp3kKb5gi0XGK06sdXu/HKzVTH
	F+dvjbPy0O0/tOgIHUMRnfxiTbSV
X-Received: by 2002:a05:6a21:6d88:b0:1e3:e77d:1460 with SMTP id adf61e73a8af0-1eb214e00eamr34568956637.22.1737540997244;
        Wed, 22 Jan 2025 02:16:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdXQyQDJOd4KIf4kCfGbhyeyHVO+S5SYOSqTwbt6zDSl82yTK4HaLifpRPxu//43HDND7kcw==
X-Received: by 2002:a05:6a21:6d88:b0:1e3:e77d:1460 with SMTP id adf61e73a8af0-1eb214e00eamr34568921637.22.1737540996864;
        Wed, 22 Jan 2025 02:16:36 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcaa3a5a4sm8897163a12.16.2025.01.22.02.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:16:36 -0800 (PST)
Message-ID: <93913627-35fe-4ca7-9af6-75bc8c4ad9a7@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 15:46:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] wifi: ath12k: add 11d scan offload support
To: Kang Yang <quic_kangyang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250121104543.2053-1-quic_kangyang@quicinc.com>
 <20250121104543.2053-3-quic_kangyang@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250121104543.2053-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GJ63HlKoj42noFnmliKu4kMex02tS4Fi
X-Proofpoint-GUID: GJ63HlKoj42noFnmliKu4kMex02tS4Fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_021639_849617_8D5B8470 
X-CRM114-Status: GOOD (  14.50  )
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

On 1/21/25 16:15, Kang Yang wrote:
> From: Wen Gong<quic_wgong@quicinc.com>
> 
> The flow of 11d scan is:
> 1. trigger 11d scan.
> 2. receive, parse, and update 11d scan result.
> 3. stop 11d scan.
> 
> So need to add handler for WMI_11D_SCAN_START_CMDID and
> WMI_11D_SCAN_STOP_CMDID to trigger/stop 11d scan. Add process of WMI
> event WMI_11D_NEW_COUNTRY_EVENTID for 11d scan result.
> 
> There are two points that need to be noted:
> 1. The 11d scan priority is 'MEDIUM' in firmware, the hw scan priority
> is 'LOW'. When 11d scan is running, hw scan will be canceled.
> To avoid this, change the hw scan priority to 'MEDIUM' when 11d scan
> is running.
> 
> 2. Need to add wait_for_completion_timeout() for scan.complete in
> ath12k_reg_update_chan_list() because 11d scan will cost more than 5
> seconds. Due to another existing wait in ath12k_scan_stop(), there will
> be two scan.complete in different threads. Therefore use complete_all()
> instead of complete() for scan.complete. complete_all() can work well
> when it is only one thread wait for scan.complete.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong<quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang<quic_kangyang@quicinc.com>

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya


