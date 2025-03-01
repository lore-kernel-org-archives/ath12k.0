Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA32EC021B8
	for <ath12k@archiver.kernel.org>; Sat,  1 Mar 2025 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/nGUNL5/MAVNh5LohVX5xo6ka5DWHkfH/+vaZgEPUo=; b=bde6s58nSOk4MsAzASpt2AireN
	FE1jvBD5mQQ5C+Dkdq/2Xy4AzqF/w2DLwp/01WxEq+wUUes07m0z/R+wIBLDBuAl+9bBSu3bwUV6X
	SycIBEHsDVLwU7p+HHckNgRYNu89nZiwwzQ5ojfFO5mTSG8GVHnrZKPM/EeOBtpTRlc4UuwXKAtwg
	y+5ga/FsB+WTM7iL26KQ2yWTD9CJLhVu9PbcL3nCFXztjkdqpYDXyYIuXsGPkLmIyA+WYI5h/2UK5
	0aYA/zphRW3e/EYM/la+CwVLV5/aaoyf843+RJrHgKi72dPPnk/J7OOha9oVPimJggFcQO4CdIiy+
	toEtgo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toF7B-0000000DQ9S-2LoK
	for ath12k@archiver.kernel.org;
	Sat, 01 Mar 2025 05:10:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toF79-0000000DQ99-0RMa
	for ath12k@lists.infradead.org;
	Sat, 01 Mar 2025 05:10:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5214m83U020607
	for <ath12k@lists.infradead.org>; Sat, 1 Mar 2025 05:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/nGUNL5/MAVNh5LohVX5xo6ka5DWHkfH/+vaZgEPUo=; b=ov5ckv+7oUao89+W
	YefWowuuliMnzs8vTuO6ZbhAZ0NFfiHc7IpcwUuqBOP1nLOE+pTfmId6Y56YvXzb
	VEZgG6mW+cIbjnS2jAu9BRnYqBfxNdRSHwq4HmPXn7agqj3HwSHhF0fUuj3O/lo3
	Xg9cC7orVZPswoNgfUQz/7mBVPAmWDsbqvpuqFNHpvOmgy3B2vZd/fJx9thv908J
	nnGFWisS9xc0sy3tfTEGuZqLozeO7io5MI3jO90XMp2aH3j57DaPTGG5nbmIjXfd
	LpX9STTcQRxP6S+XplDybeok/ZqzkM7GBSASLd1ST/Ug+DuJ/5CNbus0zEDKQXjd
	hEmp6w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453uh7010n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 01 Mar 2025 05:10:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22379af38e0so14322475ad.2
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 21:10:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740805814; x=1741410614;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/nGUNL5/MAVNh5LohVX5xo6ka5DWHkfH/+vaZgEPUo=;
        b=mTSu/lxbS6Gf+Uwem3GQR32LAcTHx/Byrv1HvFpBEB8s3JqkP9JZMEDknzDXIUDnj4
         cZTUuBePaeuYiZXm77OocE1bfRAL2m6wovldf/m24VrXvJVZv+bQn7U4wlWD3etNrydY
         SQ/Mj8gxetO6J1elXWBoEG3R1h/N5pr6jVUOj8na5cTECkX5CiXWfdYpu0Uhfge2tHmi
         geYtyK6saWcJXTHcHP/oA4zwPZGYvJS7cGSoENl3jZgmat5GUdwDTgPiCeavZgvY+8re
         q7etx34GR0qhurPfeJYS/W8+AqjwGLvnEOr0ViQp2X7QyI6QIv51tfI+mPCvOoV03ywV
         QGTA==
X-Forwarded-Encrypted: i=1; AJvYcCWReGslHr1cZ/Hnfk1FXiPgYaTvV22VynhmPrvmQrxvxwQjgXPrmCLvBb4suBboy38h4XmTOMc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yygf7tQktMzVt5Lp/c5P3wAFiwJ6biEqkm9DOvecYpkcUlwVid0
	7N4eEM0jGoUG2fc7A47fvutHv5mWLujgDWGz6gIKtfNgljklQu5Mo75e4HCLGilqaC6FQx2ZzKI
	DTBqbCwlIDP8AZqE0hLQidwxNV/OgGNDgmm3d8XPdQy+F/J8fO98/O3hvWUvA
X-Gm-Gg: ASbGncvr9YyHoX8ZvJrhSUjLH7NEP0/FYy/I972jBky0mWlcMQhV6Ls0E5Pf0QlT1Ew
	YPwe+HZrA+10u0r66qOojpFpbvZ0NTUrsa/rzHgpv+/x7MLRjk7msybWzllGeK2gIB+2WfF/rPL
	mvQbAm7m+CD27lRTd8NGJrZPcaDtIsTkSmlNK7JaSQNahXXnsxk4VnBnvffnzCGEwEs9UCjPL7Q
	32gPMb1E6qYZJ9A+CTwNMX8GBQtZtS+QFZuH5L3U5Vo6W7mWiTeGYkJj8erdqJSMY0Hvig1qlP0
	SmPi8wKLdkrBt6wixfNuyM8IN6lCGsDl4TR4fXu/G1WCWRfM3swGmEH+Dg+pqto=
X-Received: by 2002:a17:903:1663:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22368fa8746mr103580625ad.21.1740805813942;
        Fri, 28 Feb 2025 21:10:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEK3Hzs8YMaX+ebCf82T6SbKihl8RzxL2usQf8Gyh24s4uG9dkfZ+FAPIt7h/dWk7RXW4j7w==
X-Received: by 2002:a17:903:1663:b0:223:5c77:7ef1 with SMTP id d9443c01a7336-22368fa8746mr103580385ad.21.1740805813586;
        Fri, 28 Feb 2025 21:10:13 -0800 (PST)
Received: from [192.168.225.142] ([157.51.160.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825b7b10sm6742150a91.11.2025.02.28.21.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 21:10:13 -0800 (PST)
Message-ID: <7d7e8e07-ccd9-da10-c84b-90cfc5a5b1e0@oss.qualcomm.com>
Date: Sat, 1 Mar 2025 10:40:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v8 05/13] wifi: ath12k: avoid m3 firmware download in AHB
 device IPQ5332
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20250228184214.337119-1-quic_rajkbhag@quicinc.com>
 <20250228184214.337119-6-quic_rajkbhag@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250228184214.337119-6-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7DX5iL9oNGzjurRghvNN5H1mK7ZBKiqR
X-Proofpoint-ORIG-GUID: 7DX5iL9oNGzjurRghvNN5H1mK7ZBKiqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503010037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_211015_154786_6189833F 
X-CRM114-Status: UNSURE (   8.37  )
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



On 3/1/2025 12:12 AM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> Current ath12k devices, QCN9274 and WCN7850, supports m3.bin firmware
> download through ath12k driver. The new ath12k AHB based device
> IPQ5332 supports m3 firmware download through remoteproc driver.
> 
> Hence, add new parameter (fw.m3_loader) in ath12k_hw_params to avoid
> m3 firmware download in IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

