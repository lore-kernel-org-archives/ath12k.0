Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1759F4180B
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=bUB22qF1PGxRCB0i5GEO1cLs/W
	vs50TYJLXjYpPMmoFXVhpmfjbvbNxvpYDsslf0qeRHOBKQwuoz1kFJshZuTx/hBjfYvC28Jc4MKv9
	uOCinqf++pkjbc6O11pm7djkEupWuapi/wZiePdTnqVt1QUpXy0AskHsc6PBfM5g8y/N1Fu3BWd37
	RsLIoK94rGPsUOinyr4XLJU1F8exqb1GPRWg9eVszqqKcj52DersohSVuyAw6ZoYi/LvlBxke/Otw
	4WNnSLobMUlm5/5/hf3tH82olC2ZSgzMO90M5c6EMoCp3p2Q+64iZIC9s0bQoOkQCnRWStQjX5H6V
	PsNWmmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztyt-000000099q1-2VmX;
	Tue, 10 Mar 2026 10:06:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztyr-000000099p7-250d
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 10:06:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9BKAk3754878
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=hxFLJaPzisZZN+jE
	+7Pri14DDd7KUEvIaQZDPIXFcX+wCQndBf/2rnxMD3KjDF2LSRo56TcYutc88uU/
	vRgGWaD4jQRkDk3jG+MV1j1IkaYJZp3VdS8bRHr7bSXu6B3yME9iAtPKWgcFTrPC
	YHCjdpoIoEpVEDbNd+XQ8QpXs/d7MJcLwMQKH7hJabjPmitf2vkM5quy3YlwPx3f
	NEHENaRFEFR8Aom5OuVVbSZ82XJUu8R6EcvuTeoRmkjdHj9Cw1u9kfyqyX2cNsLY
	Hvj+bMa4eU1F7DnjQrK5jiyHp48hiSndNP4UqB7+sVMSKIZnTDilIS0OpDBWzNPf
	Th8iDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477jkv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 10:06:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5092135f2e9so65365561cf.2
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137184; x=1773741984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=;
        b=Wf3VY71ndpI5WXsjPWsM+QLMNViNA6h4zmjbgM10R5GSYfTBCNWw0dAKLELc7jnx2l
         mEaIzPgCgRiRSBO7UUlX4xT0dU9gaxOVEwINr4ZeNi4BxTuhKcmjOmDisD8jkeqGt7QS
         HwWayjOIqF2p/IbtLMPnJr2e8+9m7JE38AKLXknZ9+xgbhU53D3HZVghhHdK3X6r4X8Y
         Vl26wJatv2fdPyAU7+LpM9SuPz24i4ktkZvK7L7S7v3GBJWUlzhjjVj1rfGhYk0e/9Hq
         EKI+dRVTGEeCNBta3BfppcqE3XGojf1Z88Jr2vdmBrChlyh08OKN7pt4/RiGmVS7FpIH
         ozZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137184; x=1773741984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=;
        b=eeDftaj+hYhRaSnxDxFZkOPkjwqzJsqVQVxUi55NIG5pNcKikuTMGFNUysSAAlgtJ/
         e1IVIW7skyp9QQKJhqr9cVOHU4lAAsuMR8MUsxZaS39UWOLScLSBL5qoM4swM7F3VeRN
         AdOKU27ypfYhM5WPt0qkUbXKFyrELsI1rQsXuI+Qq2QkagOFaqbcPQB+93289YCSyeWc
         u1vKWtB0D8YxXYWzfGube/xwDKXjz2aUktbIN9rtXNDN9gL8Z7nAQa5Z2xQ61TYTmJlr
         FxnTDWuC9N6oFar/NzQcq0v/iRVgtTsGuvBGkIttzBs+ruO7g2Mc58seTYz/954usmog
         YLkg==
X-Forwarded-Encrypted: i=1; AJvYcCUT9wwsh5XLzP1jJkIvMaZjHL0UaxWXQ0ssjPt3ivyFdjwUc9xC/HYP+cREPkkHNKPA644q0ao=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeOhERuFJY505Rnb79Tc3WEC//FvfmrCCw13vylYKL34Dlbi1f
	IYvBD5aHhyC8b5mrYiPRmUfez05GQtpeK6StrQzGrqucGmXezjYF2g3oULwosWPCDgS+C5++a32
	NE6BTfoW8T5mPyGa3hcWdEIvXGZSam2y7P6f0fZK90uJnivAIKF3NvQOmNZYHRtNt
X-Gm-Gg: ATEYQzwbMqWILKUv9kAHi4Jj4RwfzT+YsYyX9LE8MPmofHjcaPMWzxG4okxdnxh58cJ
	iI+w/JoJxrO8sKfVmCxiTmGByErPaqC8cs+YOw7bvEojo0rq+fg/UpI5feBO0GCgfH8rkc/aFDL
	LjW8QaqYzyGG+UW3QAgmIKYdvrEWXfgetrGAkz1W0sdt85vM0rQ31Zjdp5pKD16fXD729mOEWjM
	Lix6A72GelfbphTUABpe06uVWs7Y5iJJXrCskVP8Bq3jMkXDbFNRoMjVCtwM5D50e2XEnE71rMQ
	v9REhoJ3+ZS+4jq4XcglZTRMuQwiJqCtTvrC7WgMpfXFfGdHgf9aIY0A7FP+pNX/hN6zTQV01OX
	0QAIPsLNkD8tCVovYv+rDZtqOm05rnEkAP0SKXCDBqsA4si2aV1GPemUxp1pbnA3IyOJgRiJC3S
	O/apWD8TUT
X-Received: by 2002:a05:620a:3943:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cd6d429895mr1705195785a.42.1773137183857;
        Tue, 10 Mar 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3943:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cd6d429895mr1705192185a.42.1773137183406;
        Tue, 10 Mar 2026 03:06:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm32447848f8f.3.2026.03.10.03.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:06:22 -0700 (PDT)
Message-ID: <58f49fb8-75ee-4dea-b7c5-28e89711f9f6@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
 <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfXyZSiqysxXC3m
 B7VHmQFJl1JBf4wrv6AfzXFsXMkuTjjEzPj/KPD/yp2ANJdE1z7BbgyqWtPWj4sXCkc+IAP5p9y
 IBZoB9HKOWRMWTHmjYENvZCBK9fqcQbcPtuO6CMZAf0NiIqWyEKjQSI+/zC2DK8bujG6ClvLZAx
 4ftky1zZgDNB/t7stypBjDbqjffTC7btiS3kiwLgVjrDnRePV7kAwijFNw4E1d9cs3M6u0KmxrN
 yZ/Qr3Bq6RAwTJmHMTl1HOvJw5DpGjIg60oRFKKE8D4o/x/9lQkhZlQtAwnL7RN+Yd+rM0toyDo
 tjKWbOxs66EgkOZOjC13ALZbBoi9zPcWkFfR11cCrKHKn2m5H0QID/DxWniyA7qBGsn8Z7X8ODZ
 Kik/0WDMSY95fPd4lwCPOVs9xDzwPEivqL3lvjN/nwcx0etQ5tXIdDKU9tTt5FpQg2F0Pt7AqyV
 uK+GOAnbsEc23vYSS9Q==
X-Proofpoint-GUID: MeGg5G5l_mDv1ZBQOG39c7Gp_cfKzivo
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afed20 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=7MBKnE05AAAA:20
 a=EUspDBNiAAAA:8 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: MeGg5G5l_mDv1ZBQOG39c7Gp_cfKzivo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_030625_642501_E35DF285 
X-CRM114-Status: GOOD (  18.01  )
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

On 3/10/26 10:57, Konrad Dybcio wrote:
> On 3/10/26 12:03 AM, Daniel Lezcano wrote:
>> The QMI framework proposes a set of services which are defined by an
>> integer identifier. The different QMI client lookup for the services
>> via this identifier. Moreover, the function qmi_add_lookup() and
>> qmi_add_server() must match the service ID but the code in different
>> places set the same value but with a different macro name. These
>> macros are spreaded across the different subsystems implementing the
>> protocols associated with a service. It would make more sense to
>> define them in the QMI header for the sake of consistency and clarity.
>>
>> This change use an unified naming for the services and enumerate the
>> ones implemented in the Linux kernel. More services can come later and
>> put the service ID in this same header.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
>> index 291cdc7ef49c..b8d07f2c07e7 100644
>> --- a/include/linux/soc/qcom/qmi.h
>> +++ b/include/linux/soc/qcom/qmi.h
>> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>>   #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>>   #define QMI_ERR_NOT_SUPPORTED_V01		94
>>   
>> +/*
>> + * Enumerate the IDs of the QMI services
> 
> In case that's useful:
> 
> https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Thanks !

