Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FC0107527F
	for <ath12k@archiver.kernel.org>; Thu, 19 Mar 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=3QbnEw3G/tcN93RNcYJU3HJ54s
	IkfU+HagYPQUH+v02HEElFiI4UkAjxyWi9xN6xE/VqaQ7O103ox0IfKuPRhWUtih+/87jDDPwinnQ
	zHbXb36J4ikCdo9eQgus3lKdnXvs5eiB3NZVCNZEYk3uUUZ2pT6yORDWtEZzVN14ndvJizcx99tqT
	tUP2aiAR5VJoLkax1Q7ewuMoFUxZR7GoCdO5K+yX1FT/HQVuMefei2IbanHsaBE2r6KSaNasZUOw4
	6XYvUdUlEzqk7VrI+RZ9ISQPtyOBLbGn8z9KdySGq/nW+MtJ7dNNdbsIZGtAeNi9FE28UnALiV22i
	NEtM16Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39J7-0000000AI3N-0iDm;
	Thu, 19 Mar 2026 09:04:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39J1-0000000AI2r-44E4
	for ath12k@lists.infradead.org;
	Thu, 19 Mar 2026 09:04:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740eb2883726
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 09:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=; b=ZKtPPF3TzQXeJCxI
	vQqPEYIW+n4THnio++yCy0Zpdu+66LcC7xdB/QnqocbGxLW7k1ce5fLn+zlp9lQ9
	XIhHU7h0OaJxOZdVDzIcCu9Klei6V0g98WlT+kjPUMYfRdBiEYuWVQCN8ld9hxFf
	Vy1pDB90rA3E+B5NKbYhKlwZ8cQaFZLVw2IsMt5wyZZ36Ny3+jKkz87EUA0B19/Y
	8X6NCs0/cQQyjFud5HJpuEljDBiXbzhQuNNs02jHMtl/P52Z2lxVfvHYk7WfYxcB
	BHotcCZc82HL7QVJai6mwxvmpXknZzIe52riBBcmYd/5VxGUTg6QfP3809c3j/5W
	+0tLSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytxyuugd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 09:04:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50921f7da6dso8310491cf.0
        for <ath12k@lists.infradead.org>; Thu, 19 Mar 2026 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911078; x=1774515878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=exrlO7A+nCxZX96olxxbzjFzwT9a3YAbOPQS372uqVvbmalUCJ42CkgoCIcnoUsqxx
         9x2KHt8Xw1nDZ/w0gOn309AfCgJf4ItIzzqwK9jxgo4dTfsAPO4EdiNjOBPFuwqktKZR
         VtmK851yuFVyhiLqKKe6m04DhfjVrO/qknfpJ5Ewlo62/ocE0nkzSTKfvlmNdYLDsxlL
         ov2M8tNUWBPdUEi6JpYzjy7oBh+7ztN1dWlpgx2WkVjejZtL+HGVI9IxuR+r3sdji/LC
         6HcQV0dxHaL6KDXGl6qWuI/Xshc8NChdkUZ4gDiHo7GfsiJnUqtElOoPFXBX5aEyt+s7
         qIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911078; x=1774515878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EH8bY7QD2EKZljMmJ8B7Le3WdFz6YOjIGZw8lo4HuVg=;
        b=mckEtQJ22xE4KbL9vlHHOftTdgtZI930M+KfJsVx4xTxtC4Ea5al+mMMYQbbd2UUYs
         bGXh9eSSDENr/Wtoy3kEdwmsBUY5hezdpXyK2XdnfpsXb3N9YnhENSM2L0gKN9m+VwV7
         rE0QOp6pncj3YTNmMwJXyg6E6t5GI86XIIoHyJuXIZGyiq0q03vnfQFLLawyrgSiPYpP
         +8GSN/6f26rIHjqzxsnIIl4GDb9+wBwgGA0qxQ+avJiHyq6ddu/2b90XN7IRDyfH62wB
         dmDWWxmWcYuLmSg5pvcD6cC94D1Ba6RDUAr4c527c6ph2ziJOt6HLDspB/EYOghPf9kY
         xMVg==
X-Forwarded-Encrypted: i=1; AJvYcCUaB1uzPq4WQsXadGrwx+Mhuee6n6NY26M1mBaSjcQ5IN/xyp/bNjpTHupIRqsV1h6RJfztRiQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp0je+fGo4DkBVl6UAdecegy3d2nv8ozqzIgB6SuK0G/OqLIwL
	g/F2LTgVbkmYgE5djWPLZepc3Wt8SHuemoQzmRItZgwWPmHq2JQKrZgc/p4J+PgcNPe8zB9/sI+
	lzMnxkNPhg3B1uT7cAiwaPYhTQxYyJb0UwumwfnKobIf2dTLfrlcmKCjoH7YcREk3
X-Gm-Gg: ATEYQzxTaSHIi2vxlLmmuyPpgldxUKnXVyF32PRI/26shjzHmTYhx1GMA0LXgP0j1Q9
	bZNKZTnLJr5iYbYTFirjCyfAZf9kZD4w9s90tMEwzuiO6+qK+v60MQORo2xtYh21Z6BLnFq/GuB
	om7aHPLIb1jgqWUIpwuzi7lBMTVgnQSNY94sZCs0/Pt0qRtlZ6wyMxySbAUCCsQawaA8WHtEIA8
	pe3reZ6Xsf5t8g4kWSB36pbDsJ6J4NSWPjFnx0/6cN/TuPk2U7ewS7oPMnYvo6VGFsCiYCoHVdk
	/V6W7SB/Fd2ThDteg0IICFMApoTswfC0FJjBUUcJoDGDTY7sl8OJxqvPVLIVLhs+yppm24B9/Qr
	hV14BIFMG2IzZ+PSKUY+MMQipyCGc51JuzHygSIfOnTBjESJT1+cdVMApaMjN9zKAxcY7PsRIJR
	9uwqhJAah3
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605481cf.63.1773911077905;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:509:2ef7:703d with SMTP id d75a77b69052e-50b148b8cefmr85605091cf.63.1773911077402;
        Thu, 19 Mar 2026 02:04:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba847fsm49542665e9.25.2026.03.19.02.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:36 -0700 (PDT)
Message-ID: <74a9bd51-8c35-4996-88ce-8c1995b506e2@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 10:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ALSA: usb-audio: qcom: Use the unified QMI service
 ID instead of defining it locally
To: andersson@kernel.org, konradybcio@kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com>
 <875x6ug6yf.wl-tiwai@suse.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <875x6ug6yf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wzDzh3o3-yJ1cTPd2eN12BalDeZESTs8
X-Authority-Analysis: v=2.4 cv=FKAWBuos c=1 sm=1 tr=0 ts=69bbbc27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=9ubS0I03ALhbG_YfUWEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfX1dYMEiDyAI1p
 pNaBv5+hGwrxhhc9fVLCSK6ZjHumTAOXTh1SRtSv7G8u7QeydckdilwECGGcdCVI9p1+8bgCxqP
 OP9HMdkcg4e9NLPPe2GDiCd3FLNBd4BDsbBxqU4QWeIkulfg00+zGOh0UqDWhj1dITAllw5Vmmg
 HJ3j7aG+XZ9te8eV2HMBYXjpOCFJsAN1Fd+sqncEP+/IKmM/2bNyZVS5JMnzJ/M5ExRrks89D3Q
 0Ahy79sms14OeSUpfn4m+B46zLBEKiZFZheVPLzXUofkO6TiYciHrIe7+HUX2XBe462gS2BVQ7B
 hSKlIlMLmQ5MvMHJSzyWu7eAZqnr1v3vP8jdY95fWJ9rscD5cZXPjt94BYTYKX9wN+WwAYRok53
 46mIq+PPgdwQDgjYARUgBbE/xUzgv8Qi2xC+ofdXEVhifUctotDpO2xyqMYcxLD4u8nv3L+vC7y
 k/naYnw76f7stfDIGZw==
X-Proofpoint-ORIG-GUID: wzDzh3o3-yJ1cTPd2eN12BalDeZESTs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_020440_019044_494C65A2 
X-CRM114-Status: GOOD (  14.12  )
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


Hi Bjorn,

On 3/17/26 10:07, Takashi Iwai wrote:
> On Mon, 16 Mar 2026 18:14:14 +0100,
> Daniel Lezcano wrote:
>>
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> For the sound bits,
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

This one can be picked up for qcom/for-next

Thanks

   -- Daniel

