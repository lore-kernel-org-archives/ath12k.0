Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616E4C35FF1
	for <ath12k@archiver.kernel.org>; Mon, 10 Mar 2025 20:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWaSKwt/0sm+5opJTd/K6Dt7zpEGvd26BHZwG2Qbd2Q=; b=fo3dMFjA0QsahCe2jhfpNsjcJv
	JOBlk8GG4Ji9guq90MWCSzxPYfnHUIFfmPv3i5cwVt7QG9dxXstot9xq2nuttdoJk94SLLk2myt+3
	t3OVs6jdR92B9pxzrp+6o1FTkNKOfLH2H/ORHse06N2lpUmBUgwLptixirLP1+/uFknkof9Go12Nq
	JJdzB2p4ac0hwY8YH/6p7d90ORN1+8YpmqlRaSPzua+GRg4eQFTtVTivjqUTVikE+17ovCKPmBx2N
	GN+LySFW+eUMGbsea95qq5leljba3vNsCDhCfN7clnVEMPVTgiob0ggEA7TVlRZS0PqS11i17W/Wy
	D/DiqEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjWl-00000003py7-0bb1
	for ath12k@archiver.kernel.org;
	Mon, 10 Mar 2025 20:15:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjO9-00000003oEG-2JKT
	for ath12k@lists.infradead.org;
	Mon, 10 Mar 2025 20:06:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9WdkY004241
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 20:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWaSKwt/0sm+5opJTd/K6Dt7zpEGvd26BHZwG2Qbd2Q=; b=ZMrMF8+z6ZS5RZct
	DhHnmYfg1hS4n724aeHgXIz5l711Jg6quztIYTuES8vr2cjVTgQdTR8tdpvWeOss
	ouuQFLQbVM1ebXgvmEPsJV19lkz9luoCwVwRlGbhQ5HAHz+yUUWMeJmECqw9DSJS
	795GB6A/ZER7y4P82w7QhlqQav7MhMWV0zVht4OLUG62PVr+yg/xlZVMOcNQBeKJ
	d/j032TXMZUWeKdQT2zzMQxW9dzfFvw/7wBTmEWseMnyxJgs77VKOWOXw8LaPkMc
	2iRelHDm+WTrvfEXaNsigivFT0bKZxZ/LiQrgaaCp66l554/icaAprKSDzVgPf4X
	adSD5Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyue0qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 20:06:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-224191d9228so94564785ad.3
        for <ath12k@lists.infradead.org>; Mon, 10 Mar 2025 13:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637171; x=1742241971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWaSKwt/0sm+5opJTd/K6Dt7zpEGvd26BHZwG2Qbd2Q=;
        b=LtPEI/sqI67VQW0BmEQzWuzRN04TVs/I+uQ5n5ihMixA4zluYMUdkCtsNrj2xebR/E
         JT0551ETwrGX7vHmsBB6MubK2EqLve3xnSUUriZaxkgLPDa261q6WD0JVv/73MhSt8uG
         gpa1LJOu2SLxLBWusIFTgy4jcBUseoaXe+Np+GuEsaBkXVRYYpcmyVXr5qeSh0kBhbgh
         k+9VcB/GmQjtx6OpIluad2QJV/lxl+6PMtGcF/7VE+4+UtOdtVzvZEepUNMXL85Y5U1y
         XGcpFqW3jKRPeNGoxnZIBSrh3C4HEr1TdCPhA21PjsbHHlPokeiRVsY8VhXyWdUG31GV
         yZag==
X-Forwarded-Encrypted: i=1; AJvYcCWUlZK3C/bzOGZphloYmWa0qVwFlAWK9tA+NK3l3uCMfqXD7qds2D6pudA0xXE10y2uJvFvTm4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/6MfXLExG0XUiivYCumF6NmCzM/YAMhRPfPoKsPoZBYNnHI34
	NEueyiz48fu7hPM15amCTCDo5rlQbZH+KuO2xEG4GgTkk1voe8cSZqNf7qCXydq1Ear/KU9IF2G
	fdpArmiWB95ucplJJBvNKjA590ARyJshLvlF44MULGFIU74CGdhvj99hTNw5TJW/xiEw/
X-Gm-Gg: ASbGncuV0ixCCjQeV5V4DZSZn25+hd6DyWXV2PpquhlUrdYPjRwuVZmo2JKDGn/dspu
	myFScT2ZG1GTIVPcytk4F5tsGdW91tFCPTMiHmBRHZmuTawIBDp/hjT86BXZe0WAbrL5ysSo98H
	Ruc7YWBVSlZ82FNlJGK3fAeeMwsImzbPR9ui2cg5X4uoKTloS5hjgu1IDAUIU5Y4ZOQ2W4zyL4p
	UFxgdfmfW3Gavpkrv2Mcc839O+gEcP3f/4QkWq/F7yPodXxbIpGdfqcVSuC9+PnT9iF8OKqgsF4
	UYPzIfpE1xR9J1ds+ZUMDuc52KWNTqm/z3dErCkoCbiCC40ohhvvmiy6O+rUMGuA1DHGCuPUcEN
	0/K1H
X-Received: by 2002:a05:6a00:1819:b0:736:73ad:365b with SMTP id d2e1a72fcca58-736aaa76791mr19717031b3a.14.1741637171182;
        Mon, 10 Mar 2025 13:06:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKRXO5Aqpy7hm1pqQTj4PHI1ULOzwIS0JSNlPjhEGkDWQa++DbhyJzHpZ2fI7xywd1An9rsg==
X-Received: by 2002:a05:6a00:1819:b0:736:73ad:365b with SMTP id d2e1a72fcca58-736aaa76791mr19717006b3a.14.1741637170820;
        Mon, 10 Mar 2025 13:06:10 -0700 (PDT)
Received: from [192.168.69.142] (c-98-35-147-9.hsd1.ca.comcast.net. [98.35.147.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736acc799b4sm7228793b3a.54.2025.03.10.13.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 13:06:10 -0700 (PDT)
Message-ID: <289cca50-b559-4b7f-bc89-e089d7bdf6e0@oss.qualcomm.com>
Date: Mon, 10 Mar 2025 13:06:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: pass link_conf for tx_arvif
 retrieval
To: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        ath11k@lists.infradead.org
References: <20250310200237.652950-1-aloka.dixit@oss.qualcomm.com>
 <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
Content-Language: en-US
From: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
In-Reply-To: <20250310200237.652950-4-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cbIormDM c=1 sm=1 tr=0 ts=67cf4634 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=UlYobBNIKLIdKoAhXwLdVw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=N-p2Yt28-VMXFBeuicUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: A4kdMW5NtIc2iE7PBPyDkSdZPMhrIyt0
X-Proofpoint-GUID: A4kdMW5NtIc2iE7PBPyDkSdZPMhrIyt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=960
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130613_699868_D87DFAFF 
X-CRM114-Status: GOOD (  11.99  )
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

On 3/10/2025 1:02 PM, Aloka Dixit wrote:
> Three out of four callers to ath12k_mac_get_tx_arvif() have
> link_conf pointer already set for other operations. Pass it
> as a parameter. Modify ath12k_control_beaconing() to set
> link_conf first.
> 
> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 31 +++++++++++++++------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 

Forgot to add tested on tag:
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Will send the driver changes again with the tag if required once 
nl80211/mac80211 review completes.

- Aloka

