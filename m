Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8CFCCD183
	for <ath12k@archiver.kernel.org>; Fri, 10 Oct 2025 01:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0qcepBGkZWG2U8Oj/qywTV50xBofD4KJeUorYpisCA=; b=BN0eIjfmBhqkOujKre1qUL5q1B
	jIxCeE4Vb8PwBHlecx6e6Mj8VGwleq6mJsPpFnYj/ekatinZvjrK1A9lj2x30Ci20gP88UseyLfHL
	lN3cAr8doD2sIx72l6qIxkJerUgyujf9Ib/ADiKoMwYuRVALmW9pmemGd1XhMW5nLIRAXfblJroaD
	xtUz42S9BvPPyba1anyAu+I2hO5RvDWUIdKH1HibghFCzvnNGC4lYfuIKlccBnPWWi5VoraMJUy1c
	Jhfy/hBP+mbovkV8gkJ6VYRj0RS1Erdj0TJK9ITKQh2Jh9Ak/6YglppVvTQWjsQvFDkcLIKaQxIl5
	w7Wke4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72I7-00000007SRA-34v2;
	Fri, 10 Oct 2025 01:51:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72I4-00000007SQp-1zLf
	for ath12k@lists.infradead.org;
	Fri, 10 Oct 2025 01:51:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EQrnn028491
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 01:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l0qcepBGkZWG2U8Oj/qywTV50xBofD4KJeUorYpisCA=; b=od3g4e15FbxQBWqO
	bMTIxlPj30IznaXTmIu4aT043x+hVUrYGSxbM9kkcT+kAVROm9aKvC3Qn0zjp5PE
	v90XxVthIVfYy2gwTImTKGvllwclw8VP8ooKaZ3Sv5WthvPV4eEPOzv8IuYxbz2U
	RsT7Ud6IcO+42JbiFWbbRYueebvd9IYgvXbjIm0iXwSdX2IgQfbp0IGwi35XE72z
	cDbQ8r0DtnFgPoU3d16h591y7G8ORD/m2dEeTkaM5wWWjzLM+e6rf04h2K0ZkF09
	Z20XLD23kFfQcmw7NX5GHGHFLkdQZxZJWpf/PYJ1DsKwSoQ4t/PogBQV6TBHHbSG
	cqdhGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kvsku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Oct 2025 01:51:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28a5b8b12bbso57492385ad.2
        for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 18:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760061086; x=1760665886;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0qcepBGkZWG2U8Oj/qywTV50xBofD4KJeUorYpisCA=;
        b=Pmj+amNVyxt4m14xR5YzS/3JlAf1ftCKD40WHOdjRrMDFYHNTEFbU77xuFQ/U/MzMp
         HPrNW557hH69/ldhRuQInuCcXk0Vn/hq8PqnPam1pXdip9uctxwcIEG2zhvvfwPTCZb5
         6n/3v9MdR+HZEBXEs8G5NkmuxjFjj8jDWIN3nrFDhdzBTmPdNjD7J5WMGSJIbZG2gMQn
         jbVamZ71Dq+oUzob2caAYMP2RMUisILHuvbpn26NzGh/c3IkMshktup9Q3H7LG9SuxFQ
         jUstwqmY+hRcNrUQNW8WEQ6tKRjOvvy7pWw4LhtRU6vy4vXWv3WWVur2dRwv66uxyKpk
         1yeA==
X-Forwarded-Encrypted: i=1; AJvYcCUIUiYZz86QliuKr/vdcaONs1126l6m5sEyNB1hODvi9iRfXeTV1EgrnJ+QfQX6Q36ZR7asw8o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxl+yd+ZjtksMb15PBIFxW36syzJg4RRK0kA2xw8vCEP3+c9Oa
	FeRjn2IOb+/GWE3rgv3020kzPMlWnUDf5Bkw+qmjpfRtiMyqtVJvMvE9zuyf8vm5Q04zeX5xIoZ
	GJ/wgYyO/Kb9PAP3VBtmnIzKn7hLcSrDdLyddVz6ucOkqOjNbM9B+nNd8huLnq7Ukg8pJcsDx
X-Gm-Gg: ASbGncsJKuj/eTOruFokqDg0EDPrUTNrMq61xXXr0hyueSJx41htLMm8b5RoZIggf3M
	xUu6MVcNXh5bGO6lyz8xB1QmqvoLqfK++zIADCYmPxbilvrp2s8+ONaTIMxEoIw9ww6xo94tGcU
	vpcZ3KNAUnAFXJW4Yuf1oM+VMQo1kyV2GyBZAaJOY8h42qfb1v5y05+rTYBPYoCG1kkVqXYreHB
	iIL9PUHgO0raJVgQ1Czn6OaFebpSnwGB+IsG9/S2ypb2o/Bd6m/qU5YAZ+hplaEt0Pp//7bQdBr
	wodxNF4Qkw69rq86Ec/3BcZvIalKlNvMzRtdXml9q3MNORJo8lXhvohnGvsYkqKQeSwoG3NBFXZ
	i1AbUCMC7LS/LyqkEB2B3HQnWyzHJgbQxUTs7fg==
X-Received: by 2002:a17:903:3c6c:b0:269:9719:fffd with SMTP id d9443c01a7336-290273567e5mr119796925ad.1.1760061086518;
        Thu, 09 Oct 2025 18:51:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbma8sFB3PEmlzHKGHW3FHLP5QcsPnM0ZrTS3vBJAlJtkIEneHrxamRbwItWq7kIrY7tYwMQ==
X-Received: by 2002:a17:903:3c6c:b0:269:9719:fffd with SMTP id d9443c01a7336-290273567e5mr119796515ad.1.1760061086017;
        Thu, 09 Oct 2025 18:51:26 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e43d60sm41361945ad.58.2025.10.09.18.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 18:51:25 -0700 (PDT)
Message-ID: <09cec070-8e40-4395-a1e1-28d93ce5a960@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 09:51:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V17 0/2] wifi: ath12k: fix TX and RX MCS
 configurations in VHT and HE modes
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4JZI+hXKhHmb
 zjzkVHEa9dvlZj0NlT5FKinCr1snxndFmwOVc9dJ+3Wh4Q/92mrlK1ccVyaqtMAnTjz80UkWkzp
 Ith8n+Fkt9QYRpD5j/nRk/62TZtm/NUdMHf0JJVhLRYoQnGg7zq/ZzkXkBP0XxFHE5VP2+8V1X6
 IZRyMkGz0upNCx1vd5UBhM0qwtui1UI2KNMrf9pmM9+k6KIVF1UjzLnG64U/ktnGyAwTRRt2eCo
 OlbfmHs6mDnghguOxjfvvecAar0WoQOvx7mdi/1y6EcWtaLTQX8LNFz23sEV2DkxtebNpzKSaaM
 fgN48JCUIzc2zlwddAvCgsPVLR02xVd0tG60YHkUVqBv8wQPDvUQ8IKyyqOl8RVfgvCtW/wR80G
 0fcpel5wf8ApI2lIvVPB2y1WAfoLQw==
X-Proofpoint-GUID: Ovj0yI-EDxutkhX_CYcCCV8XnUJNQtgy
X-Proofpoint-ORIG-GUID: Ovj0yI-EDxutkhX_CYcCCV8XnUJNQtgy
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e8669f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=4rw4-q-ApGJKCmb_CVsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_185128_525427_2BA0082C 
X-CRM114-Status: GOOD (  11.47  )
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



On 10/10/2025 5:16 AM, Pradeep Kumar Chitrapu wrote:
> This is revision version for patch:
> https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
> 
> changes in v17:
>  - fix spelling in description.
>  - change wmi.c wmi.h copy right per guidelines.
>  - fix missing recalculation of v for TX MCS 160 in patch 2/2.
> 
> changes in v16:
>  - remove patches in series which hare accepted already
>    https://patchwork.kernel.org/project/linux-wireless/list/?series=977538&state=*
>  - Fix review comment on last revision https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
>  - Add similar VHT related changes into separate patch.
> 
> Baochen Qiang (1):
>   wifi: ath12k: fix VHT MCS assignment
> 
> Pradeep Kumar Chitrapu (1):
>   wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 12 +++++-------
>  drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++----
>  drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
>  3 files changed, 14 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 94aced6ed9e2630bae0b5631e384a5302c4b6783

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


