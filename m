Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07117C3601E
	for <ath12k@archiver.kernel.org>; Thu, 10 Apr 2025 03:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BwQN8ZLX0shRUjYzjaBWJRw7RViiPb1RmqW9J1Fr9E=; b=mlFSxEdtQWj/SDTttsZQcpk+eb
	dPaELCnN/ttGHmnEf+wOHmd6x848bONSdim4AWzTDZ13uqLcmnnOJch7BWCvHauov+J3JIxPhhW2Y
	oZT897KpGGCkODlbKfrNM7MzFjPmPuWaOa8A44V+XF2TovcnB/J7yJAIEzQAjLJS73hNZm8DexGVD
	lWHwH9fzvoSMACM5JDlmULg4ac0NjR/EQqip7g+Yqy0x0f6ijirioWaFFMt9re4nlb8gSsDfbbgKF
	MPt9WhDqdBfAr/yJZhz7/nVtJMHeHJIklOyNUNJEHBGEatwn/d8z6qih9OBuguFqXXWCJdx5TnTIa
	GBSeqjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2izF-000000099XF-3EXn
	for ath12k@archiver.kernel.org;
	Thu, 10 Apr 2025 03:53:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2izD-000000099Wi-3AOn
	for ath12k@lists.infradead.org;
	Thu, 10 Apr 2025 03:53:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HYXwi028998
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 03:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BwQN8ZLX0shRUjYzjaBWJRw7RViiPb1RmqW9J1Fr9E=; b=Q59NCJSLtoSx75zj
	7nmDa/5K9t2O5AGc3ZK6eoioWB8ep+jcbG7adAHF1NggGL491myVWxjGtf0bPfZH
	ETIdOdHR6nda4N9DsU7zFxuFbJEnWT2rROmOuK2FmM+IkpGDkyiY1uDN7vRoMZXd
	yvZsQ6DHkbX3T+L1YAU51zYuUJxZdtpnSy2NcQwvlWHAhVRfT4U9dD/zIbQdtaYp
	LFLcaw2wBiAjS+NmRUuVIiLrsfavSgNb0ltkGEyFS2kVqvY7OPJVTF0hhHW3tSB4
	iFvbNNiLSdJYcXbmM2TVQzBD96xZIfTSwQVTU2/Fe1TB7Xygq5vFjobpdYKAUCJl
	3VrJrg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmdf4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 03:53:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af547d725e8so231085a12.1
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 20:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744257233; x=1744862033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BwQN8ZLX0shRUjYzjaBWJRw7RViiPb1RmqW9J1Fr9E=;
        b=A7TlbmIAJwiKaJl51vAGLtGV3gtZvrq1Zvg8YCE8EDAsViNcsn6oDYx4XURZKKv5ya
         vmAeXIvml58JLt4jxTqbYRTRTf/SMCJeK5dDzQSajI0cpOJUImiXtm5oBOZWBvWpHTIl
         xYhyd7bkHzGbN+iW3UXYNrr6AS5V3fGnXebQ3glvpLO0tTj9D6QT3srPZkwWKbMMcz2E
         mFc4BBMemI7SRgBJ08artb2T6YSAg0sCpqLCRDXG9HDQUVZDYlyLEOD6Vgq2gYRq9NUx
         ZlIQsOwOoO8qxusB3dQG69RPbAmG9d8bTgc3lnxuBsa9w4yCXptkDHGoDEvPoNJ12Peu
         swMg==
X-Forwarded-Encrypted: i=1; AJvYcCVtDzJrrCz62vN55wrygUqGgI68HVMxpkxP2t314eDgZxtJ++xrZRixeFDOnR93epilVGe46bE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/7q1SP5Ksll5mE9ZuHn7FLWKXpg4rcIp/RyL99udKwLR5WkRU
	lVkajQgeWibs0HdKOtbKLzzurGuwFw66MNz52eM2mm4oloL0bIdSmxlQDxS0kkthVs29R2l8A0f
	U+UMU6RPnExc0pQfd/yYL+uMyEkY/sLCrBM5NB6c2SkK4tmbsG41GF3fI7xa9
X-Gm-Gg: ASbGncvDbDxIpqTyzaw3o/duFtCaiu0wr/YYNps45fOSq4/M2W5QCg6Gahil0/K77ut
	gBfLl/GWqzJ23h5wVm8PCBwP0A4tOPl3I3VnNQfho08D5EHMgGP90Fn96OvNDMkX729EAAUsizC
	lN6AIvHdOje6aY3ec+Fd1zGuKTUwoYBpIeV0Qjdvwa/TPSYApTwwYHiQxRleDDpg0R5hlGUuY+c
	xwRYye6KH3ci01yG+63iI9Hxb1XVMQRb+vd+RZ10cqedn9+9+sYRx386iVpkRlvNKBG54QPtxfS
	cBArOvxEDaH761jNddx1XIJrezk0tmM1HUMb83ns/54nHEuTp5PRDw==
X-Received: by 2002:a17:902:e809:b0:224:c7c:7146 with SMTP id d9443c01a7336-22b2eda991amr17034615ad.6.1744257232957;
        Wed, 09 Apr 2025 20:53:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEfEb18+Rhlpf1/RDPVJboc0X1xFVoSVuJ9QFYvxIDPyjZsh2JT67I8y6sbCyKc2QzX+5nMA==
X-Received: by 2002:a17:902:e809:b0:224:c7c:7146 with SMTP id d9443c01a7336-22b2eda991amr17034345ad.6.1744257232551;
        Wed, 09 Apr 2025 20:53:52 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb68c4sm20327145ad.202.2025.04.09.20.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 20:53:52 -0700 (PDT)
Message-ID: <64277184-9cbe-3ac6-5972-0b4b73f0bd21@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 09:23:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Disable broadcast TWT feature
 in HE MAC capabilities
Content-Language: en-US
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Thomas Wu <quic_wthomas@quicinc.com>
References: <20250409053830.4039467-1-aaradhana.sahu@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250409053830.4039467-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C_5ELkgv0J5mHnCmMpqmN-VJ1T6uF0Jq
X-Proofpoint-ORIG-GUID: C_5ELkgv0J5mHnCmMpqmN-VJ1T6uF0Jq
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f740d2 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uXoGulTGKWFQ220xZdsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=704 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_205355_935333_6C65DDEE 
X-CRM114-Status: UNSURE (   7.61  )
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



On 4/9/2025 11:08 AM, Aaradhana Sahu wrote:
> From: Thomas Wu <quic_wthomas@quicinc.com>
> 
> Currently, the AP does not support the broadcast target wake time (TWT)
> feature. Therefore, disable the broadcast TWT feature in the HE MAC
> capabilities element field.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thomas Wu <quic_wthomas@quicinc.com>
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

