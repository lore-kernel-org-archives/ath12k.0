Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26892C83F34
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nctCoQOwVx2VreMm80S+O1eLM/uAvusb2nruLcJYSPo=; b=HLymliQWIJsRkr1xWsCmw3ugKQ
	os+6rbCX9SD7vC9u0bkRIrRISVgYb9x/k7sCCjLQTI3i7J6AjFDlBRzy3yF0wbHn5d/2MNKdGBB9a
	p0tMnbljICrNP5/fyk35A+FC7767/weU7ZKG2YRNsGwQdak+vDqjhCgZOcN36N8Jregbo9VFfrrx/
	bMbDzUsEcTrCIkhFD0dNDS6viEubGw1STEx3jsK/zR8XDaHqQ79u1GSzBLGfg2WHeiasioYTRTZth
	9L4MzOehodrYyPsPluShEblW6c4cETWkIA0V0xhMmGI9SFXHCpKwd8tSnOUyFtMtyreMyDMSp5Fq9
	os8JjiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSC2-0000000Ala3-3iOS;
	Thu, 17 Jul 2025 17:14:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSBh-0000000AlWg-1elc
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 17:14:31 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCst9r021647
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 17:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nctCoQOwVx2VreMm80S+O1eLM/uAvusb2nruLcJYSPo=; b=TboCK+3Xdsla+WRb
	+6+fjn9MpovDRp+u5D6SDB+Db/PUPGxLlThxXf8lr1LWeaSqxurfxfp2e9enOvEq
	nWqEQqqDi+V4eTF6U6Wru0MO+RzEJp2JOMFTfNeqmQb5BeCxlJjRnNroTfJdutI7
	dueczVz8MhlMwQqljISJi+Ed6TYi1BxZR4eW5ZKHh5DVt+v6RchvsjCpxjJNczIk
	BUQ9a0UMzXfIQtC+r0Zp+infObiNj/mEfEELdw9l+qVY3Wjc3HeiFonsNGHMqYUf
	a0r6t4L6Zt2n78fNSW+a/sfWP9fqAfYRc9lY87UBANqzS0QJtivXTEvocjIGiaUX
	R6FLAQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8ge1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 17:14:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so12501975ad.3
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752772466; x=1753377266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nctCoQOwVx2VreMm80S+O1eLM/uAvusb2nruLcJYSPo=;
        b=QPiQRlXFtNJx4ESZfQvqoP8FabIT83ItV9JtWkkMQP2D2vvxFsdygC5GlCP4Yhzy/1
         7BIHwTqy2KbJ2VN72jJbS/kxydWWCLMzdGiCmoUP1rjVH7l4KLQ+NwtNH/XN/KlB7Dmr
         uRS26TmYD37Q67Com4+XDMlabDjSRxbO9rRu8ZA8gdsQya/GcelnYCwmg4F8WDCd6+9T
         xx0riiuPrVBrppiQqGVwk2oQ9T/UbLMHXpSgX1ysLe7nsGJkkHcSfuH3sdq03noj5slM
         iGvbmkPom5TFVsiCT+K885o7CSLukreNNSSqG36BPISw3QxhKuwjU1jhF7KasZ6qixd8
         IfDg==
X-Forwarded-Encrypted: i=1; AJvYcCXGvPycHnk5DGIPpRald1WQVBSIVjPSPjooIOdYZ9eL1DY/yjPoaWCFI6MFHGl0mba/KO3mbvY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv/b8U146KtRn87SudUBWRNt6LTo2HM/gNabvEU4uJMliH8/Ji
	hWlsToiKDY8NlwKV9bPYSAWeP4CZLIh+zJGPB5tL+U8kbp/ayMFFHBWujfWKUpVXIbmy9Rkb3+w
	Gef0ANp5tfBQcU6ItCf45pMD3oFjpUkDt1KKgNNnJiUG8QXqc6DPAyXeeQugGqsyKnR0dLmSa
X-Gm-Gg: ASbGncvLRIxdOP6azKv7Wx/wAikSYkYja7P/F/ucoEJTqzv1YcoBqULuxao8HR4oSXB
	lNSUef7xq7HSHzY6Jbhk3YWxv1w0LbusLwI1SGMWQ0BtLolT2e18YuYeU329PsTvJS4WZSjQhDF
	2wgbQdb13nyFVl0Q/Ii3J6qf8mGnHLNs7+VWtEbVwhnSis+0LvAX5c8PXBjLi5sqQlus4NF5qzX
	kQDMELxpS+h/Zew7djx2+BLFrofHUclsbVzJRJLE5sxtlFL+u3Tb025vyTatasN3abEWYJwaWY9
	H5vcAa4lNsay/FY0yHnOw5xEyABFACS3ljM8b6SgJWfKnNGTySoH0MORP733hbnzLOR+6sr0zUq
	v3sUVrBEJF2h5
X-Received: by 2002:a17:902:e847:b0:234:8e78:ce8a with SMTP id d9443c01a7336-23e25771857mr105318445ad.48.1752772466393;
        Thu, 17 Jul 2025 10:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQxieo0G9qOuWsHwOUb+yMkawbhF1C4BakOeNyDTCgxsQsoNMgvnnSNbaBLBbPkuoQ6NXs8w==
X-Received: by 2002:a17:902:e847:b0:234:8e78:ce8a with SMTP id d9443c01a7336-23e25771857mr105318125ad.48.1752772465938;
        Thu, 17 Jul 2025 10:14:25 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.215.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341833sm145166655ad.173.2025.07.17.10.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 10:14:25 -0700 (PDT)
Message-ID: <24dcbd98-cd43-b155-4c24-7d5cf54cc07b@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:44:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Use __le32_to_cpu() conversion
 while parsing wmi service bit
Content-Language: en-US
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250717064527.1829660-1-tamizh.raja@oss.qualcomm.com>
 <20250717064527.1829660-2-tamizh.raja@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250717064527.1829660-2-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1MiBTYWx0ZWRfX0wFzY9x73eHB
 n9+9a0roNTVzTbUM+nOo4oIFayrbSs2RZ2FTddeYiJOGhfC0D9wkIfIymo3c2zdjvHUJxK2e+8o
 n0DHNAg+61s96DPl3Oxgu1zgbE0eK1zod0IKpeSJyNN9Xu3U1lMatDB13K71RfzobSQM3C9G+67
 wWOQb5nAgtgah3wa4n0iOgIRH9MQix3CEXGTOyx5P65Pn5cVpn5gOquuirXXQSk42CoIHKSNsoK
 tA4qFSW+P96jX4HKwsVJZJjFL1RfZsKeM0lm3hXSJgBsSbdLSNFvBYAkZOv3akOXrj1YL3b5Aap
 F9RnmAa5jDCudEwBehjfDLQ+EIM7YNanwIRxlhzdXwKLVrch0hvCnegsfk2C9cdCySxOqh+kNz5
 SgsA39J6PmpkbH6tvxMY5pISMzPNCFjAwjFzGRTf93cEsqA8rEEawwa4iBHtg4LTYspZNjmr
X-Proofpoint-ORIG-GUID: qgfR3kc-55asL1X1Xtp2kRCk3h_OdpED
X-Proofpoint-GUID: qgfR3kc-55asL1X1Xtp2kRCk3h_OdpED
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68792f73 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=yGYHVi08oRoRdJ9zovgz5A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Fk5S617eLcW_KvA3zIoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_101429_555480_840B3029 
X-CRM114-Status: UNSURE (   8.68  )
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


Instead how about title something like below
"wifi: ath12k: fix endianness handling while accessing wmi service bit"

On 7/17/2025 12:15 PM, Tamizh Chelvam Raja wrote:
> Currently there is no endian conversion in ath12k_wmi_tlv_services_parser()
> so the service bit parsing will be incorrect on a big endian platform and
> to fix this by using appropriate endian conversion.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00217-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 342527f35338 ("wifi: ath12k: Add support to parse new WMI event for 6 GHz regulatory")
> Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

Other than that

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

