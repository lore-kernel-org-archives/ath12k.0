Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D809CAC598
	for <ath12k@archiver.kernel.org>; Wed, 17 Sep 2025 03:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cep67SnTfnADXcOmFM0wZ+47pVbXaqSC/dRePINIa3M=; b=aaENoi2AmDrhTAr1sULHaSV+ca
	zd3X10PkwVmTZMepuRXhtLR/T19PwZ3j0t/BfjevT1wC3Pykk1NecggXDej2zQHUPJ24ai6cFJ2Dz
	BaM8Z9Zjwh0pBUa+HDRuCpu4KTYBNE8cymJbtR+3luzm2zuhPcnY/OgWJL3LHI4AkdDaDqLcJIf2B
	V0daZJnnB8KpW7EF/5DzWtP11Qdy6F/ZPZZRv749SK27cGJx232+yPROV9+wZ3d184oxP5nzs4Kvr
	3HB8LSRdU0JjQr7GJiOr2unuVkmxZ9+x14d7lOtfljkLJQHTAz4Pww+Adi9bhacmY0KxPRMMV5VV1
	7+lP0erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjEn-0000000A7FX-48VI;
	Wed, 17 Sep 2025 03:53:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjEl-0000000A7Eo-2tnw
	for ath12k@lists.infradead.org;
	Wed, 17 Sep 2025 03:53:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaCAe016281
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 03:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cep67SnTfnADXcOmFM0wZ+47pVbXaqSC/dRePINIa3M=; b=DQ5IYe8zCWBQgkrP
	1OkP6M8IejcEYdrmuxaD90k7mzkhy2nbk7OW4h5jYcV35u8THXsUcrHMDNddolsl
	de8DbAQcEQX/q6SENMcb0zZuXxgV/4DOxNJxJbcC3DqD5+Qbyfk2Prw0RwVCv+K1
	kJ03hsNB3VKm20eR8LIRMTOUy4RYkslF8lUrZxdEiVypg3bCB2EreZFI+kaalfmw
	Fzkl5nZd8pVLPflxYWhgzySvVRuBK1Cpx1UnBwpWJ5eEUG1x30n/VCpHJrUCS+5N
	6dCYy1KYeI8UVXMpqCIc4WRuE88GxINAgRtoyS5g5Xc3iUD2AsoyRXrp5OrtnDKD
	gJDP6g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxx8tt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 03:53:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32d4e8fe166so8700411a91.2
        for <ath12k@lists.infradead.org>; Tue, 16 Sep 2025 20:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758081221; x=1758686021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cep67SnTfnADXcOmFM0wZ+47pVbXaqSC/dRePINIa3M=;
        b=G9ZW+Xmmj3IOejY3Uwo0jxnLyApkzXWufCTeabf24ODoK+Eesyh7JClUoBbh+rB7OK
         r0/w3RWCZKuevxoeTdcQ0YmSxeW6AuDY1oHjqkLmCUVR68/Ha8LiUObFxEZCR493ERZx
         cWt+s/PsDp+U/MMEBxCnul6WhKKOBX10dTMlQkQHYP1QUClQCw5zZhkD2sGJC1BrU4yI
         HoMPU274P6M0Dz9Nvk15ZnQbZthUqwn6GCx3PB+By7S4jfFjdnQ/7MllN9FFHAiW3ehf
         iUr82jRbIBwFW3X2XgbAs+WbqapN28C8xK+MjRyDbP/5JAyVfu5fmtI38t7TlBnnY6gt
         NRbA==
X-Forwarded-Encrypted: i=1; AJvYcCVaj3anb791TVWCJLbpTsmxR1ihs0fNoqReh6WDZo2b6Tr3Sa1ekdnvLuuznxvz7OssRbHNBzo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVgPtzYlRD3GIMLbTkDt1JeBbp08JKuxcoWhRA8xfINSeH2AmI
	oMVATr/ShfScH25cLXSLX0RQej1R3kDDYaCdPUrHjzfdUcVMJNx4In2tF8Rhxc1dUwDekrG/9qg
	tFVZhXUhx+KwLnKV+MAspCHCwnf5m8v+uZy6Y4vJOfwjK004F6iNdhgwOtqrLjZeU
X-Gm-Gg: ASbGncswHGREOCIfGKW89sdAPIRedIebb5cNMmkTp11JAOXsj9tDuk+94EpoFUej/hN
	b+mbXW24mGlrcsuyd9+UvEtln10TZ2FFyEhKB4zacmY74e0vPANFGyFdRjLHC/LlW+BpVehviTP
	+4Qr/qc7oiIbjfiKBBYKquXaMCas+N2+8KjGqg025uZQLPfIMDeQfWkceX/OKiLLDWGVTHQjpv+
	wpJOWtJeyD+/6rvyXup9aTHdOYMVa/MTSAElSLn+FZHLH5Wp9uNYWORZKt/NSxrovQ33yrvXXoH
	fbkMgeZ9UwiBBjq9Qdy+FUxIbHqe26b7vg7X+7ZWY423CgdwAOzPDY/AOMPC+zsnCAqRvIiN0iU
	iM1PE630gkI4=
X-Received: by 2002:a17:90b:5348:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-32ee3eefe77mr975445a91.15.1758081221359;
        Tue, 16 Sep 2025 20:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhkw0YdOtL29ExmK2v3LOWKcGCk1jKtiEcNh06EUhootqyd/kiRmyV7nVn1zQ6nwDbzwHsFg==
X-Received: by 2002:a17:90b:5348:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-32ee3eefe77mr975422a91.15.1758081220864;
        Tue, 16 Sep 2025 20:53:40 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed27724c9sm985762a91.27.2025.09.16.20.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:53:40 -0700 (PDT)
Message-ID: <a5778370-d889-fb9d-0ce5-498342bbfb2d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 09:23:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/3] wifi: ath: downgrade logging level for CE
 buffer enqueue failure
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        ath12k@lists.infradead.org
References: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250815-ath-dont-warn-on-ce-enqueue-fail-v1-0-f955ddc3ba7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3E9kyakZs4XJBJ26CHtyifxI2931-YPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7gfNbdUhLYt4
 Dzfw5Nhyi09/5VdXLotgGBnZA/CxZseYmHab6jxqX0yfQ7cU2Uq6o2P7gOXmp6OptGdfh1WIJ1C
 oWKnj/AORZYOn7cfzBfbm+UYCZ7pbG9Ik+27uWRykArN9a2J9GW0N5W9YQSpwj6mcmi2V0Z0znG
 mBHpusnL2waTkPSHM5b0ck8FpJGW1DQKlsiTijaEpSQAGdKuL7jgRlRs1kiHb98nTw3v7T/c8J3
 C1GZrcQDywXxwrh7M87yvsK4U+TVtXfeLzAQZF8JlLi+Wpg80NKMlftULIInWNpcUptlRk0S434
 NR/U2oes9if/YWpvX2wK037nAxz57+FmNJN0GVvrZCHwuYJTptywp9rtucBteExZhpkpeHcseqn
 7viL6/IJ
X-Authority-Analysis: v=2.4 cv=cq6bk04i c=1 sm=1 tr=0 ts=68ca30c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=r0KOKur2OvuaYElxfjaavw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TpeBPK0GJKfZ0rfD3RcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 3E9kyakZs4XJBJ26CHtyifxI2931-YPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_205343_845186_EAC9B35C 
X-CRM114-Status: GOOD (  10.86  )
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



On 8/15/2025 7:14 AM, Baochen Qiang wrote:
> The CE buffer enqueue failure won't cause any functional issue, downgrade
> logging level to avoid misleading.
> 
> Also fix an incorrect debug ID usage for CE.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (3):
>        wifi: ath11k: downgrade log level for CE buffer enqueue failure
>        wifi: ath12k: fix wrong logging ID used for CE
>        wifi: ath12k: downgrade log level for CE buffer enqueue failure
> 
>   drivers/net/wireless/ath/ath11k/ce.c    | 3 ++-
>   drivers/net/wireless/ath/ath12k/ce.c    | 5 +++--
>   drivers/net/wireless/ath/ath12k/debug.h | 1 +
>   3 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

