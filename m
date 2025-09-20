Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB376CAC5A5
	for <ath12k@archiver.kernel.org>; Sat, 20 Sep 2025 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ana8meb3LHSVJnJyVOUf7gTwHScScF51sLLwxr1JAzc=; b=yD16XsqJVsNsdhzaB1PF8SrYi5
	yu/Q99/eputlZ+RImQEDxARpbPZlKDb0BcPqas2bQXC6GDIUbD/YSagWXEdA1zfFzTf80HndABver
	b9K4OLnMgdhoPPFx14vMdk7ZIVNMqsTkx7iWABBtsMYIbDu0OICQzcvRgK6gBm9Ufrh00iUjyuVMz
	qwq2ejxo4hU80dd4KtgvVCD2m6JLD9aT4JYCfx1X88AzPoYmnpLcscf/ZK6+7e3uZdEp7VyXTCdsN
	zonmCnnfOvlDYV0EAyDAeEFKK6zgN/rixKxeRxAkvOTTW5P9PRSvNd6A0Y6ZKcbqoC2vepeVc7Y+l
	LhcIF1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzvr-00000005ZfW-2btT;
	Sat, 20 Sep 2025 15:55:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzzvp-00000005Zf4-3qt9
	for ath12k@lists.infradead.org;
	Sat, 20 Sep 2025 15:55:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3Grtp025949
	for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 15:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ana8meb3LHSVJnJyVOUf7gTwHScScF51sLLwxr1JAzc=; b=omqj98/9y2UsYy3J
	B9CUW8I+wxx9gMctpszRNYgcaOXyRmb1FksPnRwJZ71Eo3z/KmCbzz6mn41JeaL7
	+2WpaqvmndKLq1RnRxDUUhrC7lSuRpvVwE0/FBddASofmudfwNCkDkFgcQDTOP6n
	O5J1Dgx2/OFP4BFhJfjMZYc5nRH6jm/B+L8OVAjtl9SogbfTXb56CyihyJ7AFMl9
	drd6P34/P+CVeToUU1THqWWtJhq3eEFMR/WtL+LXcH66Gp6eWB8OZNXj1xROyFoY
	9nOA/r2a8NEMUDsgfJqgRJXTdEpeOhhdlP2RC2n/QJjKz1tYjflEGllWXgsSnlpK
	AhnfSg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0ry8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 15:55:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77d20efe2d5so4137642b3a.3
        for <ath12k@lists.infradead.org>; Sat, 20 Sep 2025 08:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758383723; x=1758988523;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ana8meb3LHSVJnJyVOUf7gTwHScScF51sLLwxr1JAzc=;
        b=LW6w0vAg4rLmexzOWp+4q7qCPGwYiPjPoj+TsEgblLxYTlnMTVP6NipZJmrb50d0SP
         zPDt4t3utxJqoOxP7nKhI2nSGXakE1ycnil4np8QqF+RPfX00q0/FCr521bMcbA578JY
         3GZkU4UTMiGx1vhcXLegZK0KSW8xFMXkvCyojVebSixEsnXxKjsrciyfg5hB8vO4eC7l
         cGQ2Qrl+6oO3d7Mw6KWOdgPnn4I9wJetmFXlRuw4FUTJb/gPLWk7MfG/wYbj1wKpKWvG
         4xSlrg+TASp4wS8hWyI4msh9JFCANrvwikeMpYKVrSMEbNbWSSEAAnVPsgQUVjoVq6nd
         ajAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp3G0G9p4EZmOipGdO0X5Y2UtIu2wrBSsTo65DMOsZ1JwUGECdXRVBlvNC6sgIja6NCKhEUpY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc1EBkXfCtIOYdEVM8LS20n3QFh3TOL8hzDtKM74a/d5znJC9m
	zkR0vcrgWq+GcQ1eSZn9M7e4FyUVxSD+IEZiu9n1wf7R+Hnpzc3hnvCN/c121suZvCPQDRiKrfO
	TQpL9FndYqMhWhVgCqqjVrNs74RbRJ0pOqfFReKkArnxrgCWTZcN9EEKjkg2wJdjXlbJEq8Mt
X-Gm-Gg: ASbGnctrUHQ5Oahg4Fbh2RTKCktpAbg39jEdJn7wKl1+7+jR9qd3rRTpgz5P52aC74X
	RiLPT5jhxu+C4hvMQ1cqK9GTlFmMapE23JsyLBu20b3x3Eg7Zfh7r1kW9muBivr24rM7V9c+Dt3
	6JfYPGfeI4Gq1ZJfuIDVETo1mwBPpp49Unk5yiT6kgT/U8Ouz2qXPIu4JhLN62oyMnYliplGB75
	XrLAzHSB7kqNK2zhZYQBpzrkF+LiYGXqmcfD3aItwfCNE4zQKOnAB3L0yuWUEGWWcnvY8xBAWkD
	53JK38/3wZ4szfTCC4qyuK3Bi1A5fcGQv69N/LmdByDB0Mtnh7+UCcL+QFdbgXoGhqNntWcsBrE
	VILk412s3rj8SISBA+6nSAcUeRNwwuhsTRpcp
X-Received: by 2002:a05:6a00:2354:b0:77f:169d:7f62 with SMTP id d2e1a72fcca58-77f169d83e5mr5467955b3a.14.1758383723034;
        Sat, 20 Sep 2025 08:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOaB7iCjI78POPZVbbl+FVK1OsIR/scW1RaIBr44/RHLmSkmoH5nr7aySf6I4T55ojb3L+nw==
X-Received: by 2002:a05:6a00:2354:b0:77f:169d:7f62 with SMTP id d2e1a72fcca58-77f169d83e5mr5467933b3a.14.1758383722325;
        Sat, 20 Sep 2025 08:55:22 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77ecd17bddbsm4548805b3a.46.2025.09.20.08.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 08:55:21 -0700 (PDT)
Message-ID: <4e204f93-b964-40fb-8eb5-f723f309a2c1@oss.qualcomm.com>
Date: Sat, 20 Sep 2025 08:55:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix NSS value update in
 ext_rx_stats
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250725084426.3989966-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250725084426.3989966-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mvn7PlfnGdsxHrI9r8Y60blrgCOUSsw8
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68cece6c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tApd-Sg5WrpdobDWgDUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX3nmdTOC1OtIV
 +FMQkioc+s+Fj1/tAtpPHQCgu2p21beoBLH5/pj4yYhlfQtqvIQ1+HhT+mb97t62f7N+UAj0Q7v
 oyBMU5UiHaJ94VXUQWleFBswL4HcYdt18S3sLD3N3xFK9RqMtzxsk5iUcbROKZ9c/6tJF9e6iZ/
 aL48dk5j8evaEZugunPxAN4OnEc9js8qCDIzLScD2ZbUD5QcPh90Y7wIu6xtQ8Wl8wd4E3ALyK0
 H0dEcnm49GgYA4r7tZSxPTKb76/HyCT/6Jd+0Mmy2ycSQTw0gcnBT5DLJd359TcWjB/69MlsdhB
 Ly+fiFtVngCVCwsPN17qL/FchbsiWMDMIAem2o3BWV1hfRM1fZwVPig3mj5fMC35JNlGlAz0Y4m
 iB6nO6Yp
X-Proofpoint-ORIG-GUID: mvn7PlfnGdsxHrI9r8Y60blrgCOUSsw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_06,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_085526_074620_E9197225 
X-CRM114-Status: GOOD (  12.75  )
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

On 7/25/2025 1:44 AM, Thiraviyam Mariyappan wrote:
> Currently, in ext_rx_stats, the NSS value is taken directly from
> the firmware, which results in incorrect mapping:
>         4x4, 3x3, 2x2, 1x1 SS are incorrectly updated as 3x3, 2x2,
> 1x1, 0x0 SS respectively.
> 
> Fix the issue by incrementing the NSS value by 1 while updating
> the PPDU info to ensure accurate spatial stream statistics.
> 
> Remove the redundant +1 increment in the radiotap header when monitor
> mode is enabled to prevent double counting.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp_mon.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

This patch no longer cleanly applies to ath/main:
Applying: wifi: ath12k: Fix NSS value update in ext_rx_stats
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/dp_mon.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/dp_mon.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/dp_mon.c

Please rebase. And when you do so, please follow current legal guidance and
replace the existing QUIC copyright with the new QTI one.

/jeff

