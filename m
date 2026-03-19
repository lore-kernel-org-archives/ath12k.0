Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAFD107527E
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=lkC/rXn8r9ZMh1W7sud5eWby0R
	bl0lbAocifas0SxW7FhmxS7YljG1E5iW3ugIPHcTNKOaRYT1cKjc8VEcHeyJwyliOAtZyUzccYK2e
	yTO1DSf5FfvnUiCTZwGc1+u4EpCjo/z2N4/uvXuS2/rCprJLOUD5hQ8eW+j1PgNoXN0707RT7uX9m
	V1ehTh0GcVtXLqWd3KB4WcgbKBZI2viF6TDO2NRrQIHJpzxnPMN1t912igxOzzsDbwK1Re1ebspoQ
	WKGXLrjgaoqL0vqAFXkFMsi8cI2Fw6gvmhIBUCP+H4CZC3J+mcslcvPOo6nqHtvwADzlSgCtFVt2T
	qgjZoZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Gy-0000000AHj3-0UTv;
	Thu, 19 Mar 2026 09:02:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Gt-0000000AHhv-3aa5
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 09:02:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73v292544606
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=; b=SOnVAmL3naEmqvxp
	wCam5A5ffUzxVU1QmNFR4kL3wVfl9kBJLap874hNnZL/A10nu8uG3NpMfPSZKbM2
	tOZefy7xFI7IbFBTZC3+UHFn2G+KuWnvWrGjNSSDg3WTW80omdEH/MQd8BVK1BtD
	WD3+ZiQR7pprQ8lVhbIgczFYijPq3rCfgPvdLMQXhuJwso9ZiGB5a6cgLIBossql
	PmQwNA2RP7CCoZ5Wnc2RXGqkpJHV3PRx4KY7bA2jduYZJnGtIsttRlXveyHJC1Qe
	VRqtCjpEZ1tbDfn/Q/uGHLwfF0hDJSTj25jpJpD3s8rZ4EZdpIkRa8Y9XE4RYli2
	8i55zw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0957rx5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 09:02:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60270cd54f1so5054427137.3
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773910945; x=1774515745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=ghnFysZ6FQX3CKyPclkdXWy176+qasgndRaE+fdiX7EADnAN2cuOiyB6KSZRrVGRbw
         +wSdB/TRITAaqoGKYxjv6JMSMVq3OHDTceqlvmhRqi+QQlI31BgBTbdHwg8rFTCYkKv5
         26+ukE12RQ0h++FJhNiTquRGvbsfS6qE08VUIdta+5P2akDgz47YMij1ctkwiYfW5ExF
         4QO0N1+Zohlk2QusJ4YlyHqn8yiIaw4FktIDSzjBXAjOawA9w2/XOuSGjUlCW+1Oy0Bt
         1hvSMSH0Yd2T+XsZ45RXZvs+C2iiwnPDYPIZw0sCp9qifygpPCwYBlA2wYnPzVw2DIyf
         WDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910945; x=1774515745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PPsdradxDFBmU6By8IXsjXvjxWS/JBBTM4uA6mDm84=;
        b=ovVIZ4yiZpLCT+b8en6cpa7uvnfYd2+ozFkDOe/ZsZ9MFnPi6/0d19+SihR6+H4QsL
         81NogVKNT14j9UHV7DtZ2UuEr1SUcePkhEPZLCfnxELNL+VgdDOID8IQuaZU3dNogI8U
         Fw9puVaOmREpMApvddbPJyo8e3mEtca0lB09kGluScbz5WbQ6uc6s6RvpE9kgtM9AEw1
         ULAspyTPHe7RMwdzukgyH7QEU4a8w2VfJwxfu8I9s7M3anVwQUqQJtuq1Ny3PrdOP/aG
         iK8tjDWHO2b7AGrR1yCjmRTNO9/t41NFcqNzw4n2QIg4UJsxiOJEkfqrTxM56JNTXcUp
         OPRg==
X-Forwarded-Encrypted: i=1; AJvYcCWLQWPx2tb4mdXejUjJfZUZNsmchTcphpuLfRohQBhn+q/MqY/DaueNf4RL0iOSJskXibOp22g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoW/tmYgEESu0aUW2oyQiX94252PYRpUsOUhuXDeB+1g/oh8R8
	K8HX1FDfju7IKYzdSh+vXKGT4QWSHfRhfC2dC+WB6ls6pke05W2YOUtb5VklFvGkRmgnHbkb6Vi
	CEc2XwaXhRzHKtfgMkiO6Scy6zgUp9IzALFeQkQWF6sATF1cPAwNnLmaUmMzflQo8
X-Gm-Gg: ATEYQzxQhGyvZVzRXNT+Ympq2cbeHXgwTs0qZMZCziYlGMpObHKMewv1/SjXqwSPuBb
	YBbkYwNgmbbrB/UZT+UGoy0Tr3ovVUIPfG0KFdQGHUO0lx4olMNffHydkJeUS2FpMnLtGnZV74Y
	ITttrqaZk2lXGXWeAR/JyiO+9ZTZoo6f4wJIJMBXzUkQSCtPJolN58GYA6S4K62h3+gAjhEQxvZ
	THi6FVMs5O57D3qRxqj9WWeq6TvZrtBmDXp6Kpovq8YAx58NyO/ddGUuEuUsb27NMEggqbMaMZl
	deHHS8U60afxxDoBIeNFFCs5Q8xLstf6kgXIK3R07WlUGA2jbzY6BKh968la7W4bJVWz4gk29rH
	PejakhpVzlc4TaLPeNtcI2AGyUfstSZ4c46B1jIfdl68q2sIti+YeOQvLMT6C8pepAwyG2brLVj
	XCkNSfvoRE
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1267002137.24.1773910945444;
        Thu, 19 Mar 2026 02:02:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8558:20b0:602:91f2:6afe with SMTP id ada2fe7eead31-60291f28930mr1266966137.24.1773910944965;
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm48733435e9.8.2026.03.19.02.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:02:24 -0700 (PDT)
Message-ID: <c26aad81-ac48-4ba1-987b-ab6c271fc095@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI
 service ID instead of defining it locally
To: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org
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
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
 <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CrAXIjXZF4amvFZ2i2k18yhk6UbXff4v
X-Proofpoint-GUID: CrAXIjXZF4amvFZ2i2k18yhk6UbXff4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX6vn7m7MYyoNm
 In7maJIsqHhsXrLNwWP5KmQV0UamRbaz5eOIM4Ar82ysqByMRwreaj+uQdXWE2pANHQQYA4vu7x
 c3cDL4eSWxXdg424/mMNqhHHfqzb33zuSxW8+fTYpStY/3R+kHeJL2oL50AZgCA9BoecpSqNAkb
 P5iX9l3nu9r000QB9R44snTesE5EkdJ0BCLt9dyMJ7YHDzYyRZxfoshiSbMe9+ePFemDCDhYodP
 pT9VXWRynP5Ph9OMeb/UOHKhGAN/qC69lFWznAlykk9mlZ4Ra8ss3WeX+nhBXGUvn/TJE4EL6hb
 lJTPj7Mx4utirwdfI4qbk4UHL0Tdb1yYU99SeODtRM7gseUjdE6zQoWUCXbJnoF1gkchcuCCawa
 kZca/3tFBZwwxdAi+nWz1rVD7G0DKbdu2xRDOfhKOMr5iqxo8AVijAIHWbkI9d/mjfeLb5WMqe3
 P1Gm6kQ6SluY01k0Lsg==
X-Authority-Analysis: v=2.4 cv=RZedyltv c=1 sm=1 tr=0 ts=69bbbba2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=BdGfMZ6iCwODMfnLSHAA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_020227_914237_02B6C737 
X-CRM114-Status: GOOD (  11.55  )
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


Hi,

On 3/16/26 03:09, Bjorn Andersson wrote:
> 
> On Tue, 10 Mar 2026 00:03:33 +0100, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>>
> 
> Applied, thanks!
> 
> [4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
>        commit: 95b6c029e56e4d75e2957ce7ac795da29415865b

Just a head up I'm not seeing it in qcom/for-next

