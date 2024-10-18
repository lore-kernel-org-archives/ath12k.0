Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27A8D3F283
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 20:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqXXdqAUk0VRbeyiVJtnVllz+xziQoWI0VYQRlJ/tXA=; b=Igd/d+XApithS5GKghM/yd2ywh
	6ibfDwjVoe9PldphPPdZAHgoeno8sz9yPEUL4WIq/AjlgExSoh/9zYmi0F+4LBHxeOiYM7XMET3Lx
	aqJ9Zb9UkBFtN25cpDd1U/cerureuGgdcbjmX0x3rpex6OeRW27u5Qa8ypqkcYoDooP00s55/wHJF
	oemw2ygLQlNO1rbI20HAFlq4wqJJBARYKrVZPIbw4RMzZci04kgbpf+70mBS7Cne3GOu1baIqQ00u
	0rBuAaM0btQxYdv60qQS0WjvI0K522AB5nH1dNiFT49+UyIahGvhepK34WfzueEd9Rk4yZFu0Ik2t
	AFidXjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tHx-00000001uIP-1gif
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 20:09:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1tHX-00000001uEm-2Hpq
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 20:09:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IEhb5O029274
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqXXdqAUk0VRbeyiVJtnVllz+xziQoWI0VYQRlJ/tXA=; b=l9Kb8PDgFNZdbSSB
	OBGoYPLU9HMAzxL0LE57ASz9iXUC8z/2LU8Ud5VNmyVClxERwIWGRze1KIJYE3Ro
	Gp9tCntKtgELkufyBUn6IkDl16uO49VlQROAErDYn57dIZwOrOxFShX5Io7ou5Cl
	g8w+aTqI/GFnzqouMne7lJ0POO7puQyuvcDgpCkvUwpsQns8y43HHWSx7Evz1LUi
	kbf/g15VbrZNVo6iHwSiLQEU/apkN0DOFMe3uHlMecJHO9LYUqoduq8AkIlyHSE/
	sbYdo6qqa5BUe8LtEllV7SPKgyuEPC7Kjq/cdg2+bB7BrPFlB6c8UypHQhBBvYTU
	rTk7AQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bhbqae9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 20:09:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cb9afcecb9so5848476d6.1
        for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 13:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729282145; x=1729886945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqXXdqAUk0VRbeyiVJtnVllz+xziQoWI0VYQRlJ/tXA=;
        b=kAfTozExuCZZQcgO7aJPadIjVqdpCnrARbrzQZNHSB6DK7cf4Gs5j8Yeg5mW8KhgD3
         PA9emg0z1UhlL5K+gyjQ6VBtoGi58juxfXaHHxbRcEqGFICJUQALmNuKjYmGlscIxCJq
         pcCPqo+nLJ9dBKTJ6OzXBDJ20AAH8OR4dRPjDTBMfR0GD3NHCiSCrSqBmCFjLgmdNRLi
         zBneVVR8HWETv4TtvhkhGsdQAVK5OA8nriKZAbohOEG+45/06MTyxGj+dU8A0bXo5BSC
         TC53C4VMF0Ghn1iYtzAmWilLZDs2ImF9o/e14BwMqAvPi8QeItL82JessWJgfAxJIdRH
         57og==
X-Forwarded-Encrypted: i=1; AJvYcCWjiXPoXYRIsA9gW1E7Acd7P8y+jQdA8rXnIl9I7kOavgvUC30CuxiE4HI0me9h0X+MqgBT4fE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLwEOXAoDHvi+6cIdcREPDCvM99iYmXnSjM/a/JMdhenR7AUl
	0xQ98+caYFp//U6kdDtMzn8qKoPeRC60Epzqs5UJfcdQsoN3qWhYLjg2I2O8AOHVauvd69jBx2K
	TMHNAsslKCNaPKUEpWPXsvZGAdWaJlLyB7cDo29/9AoWO3jSw+vsiGJsTxNfO
X-Received: by 2002:ad4:5ca1:0:b0:6cb:e610:f8 with SMTP id 6a1803df08f44-6cde1660d50mr19821566d6.12.1729282145492;
        Fri, 18 Oct 2024 13:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxBCQM5Tk5RPdtwn4L8sBL08cpiII7WgMfMKoYedB5n9Up4SRJF6MZW5WmLEK72Yj2So7J+A==
X-Received: by 2002:ad4:5ca1:0:b0:6cb:e610:f8 with SMTP id 6a1803df08f44-6cde1660d50mr19821416d6.12.1729282145117;
        Fri, 18 Oct 2024 13:09:05 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b0e6b6dsm1067423a12.65.2024.10.18.13.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 13:09:04 -0700 (PDT)
Message-ID: <e7479d31-bbda-4bec-af9d-ec6bab24654a@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 22:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] wifi: ath12k: remap CMEM register space for
 IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-12-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-12-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OxC40y3y_iVvq2WDr7pOJ51LuShM9D5t
X-Proofpoint-GUID: OxC40y3y_iVvq2WDr7pOJ51LuShM9D5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_130907_624731_27B4273A 
X-CRM114-Status: GOOD (  10.16  )
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

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: Balamurugan S <quic_bselvara@quicinc.com>
> 
> In IPQ5332 CMEM region is outside of WCSS register block. Hence, add
> hardware param cmem_remap for IPQ5332. This parameter would be used
> by Ath12k AHB driver to remap the CMEM registers to a new space for
> accessing them.

"would be used" isn't written in a very confident tone.


The commit title is misleading, this change doesn't actually do any
remapping.

Why is this region not described in the device tree instead?

Konrad

