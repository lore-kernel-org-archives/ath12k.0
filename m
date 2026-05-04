Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFC8FF886F
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=; b=t+CZLW2eYzzpZKieF+EelVP85v
	b1pAIhFHm6FX4QJIDdlgRfvnTIYHK2HtnIkdgXh3EROFZA97nu6pKeM9LXf1Bi7TWg7ioNT2cLUSW
	h2YdHSm37mDikRgAhqbj8gyaZEszfZbapcW3xzZTzQEpKzIeTjriBS4sIRrWuC9qtwA9SnkKs8xD3
	A0nLDpA2pvS/5/UiGy/812Lo3XJuurk3bXszvrXGjnRwyok/uEi9+X9hQujyJrJlWjC77XkDjg7YK
	4uQvgCFw/trPbcgCRWg7Y33Ib9OQd6ftOuuHxj6jyyFqyJD2WXoDDpmOfNjzbJLpLmfbBrYV6hZxs
	1XpVM2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrrQ-0000000D5fU-2Cdr;
	Mon, 04 May 2026 11:53:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrrN-0000000D5eb-1LB3
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 11:53:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4EDM4128839
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 11:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=; b=NWLzZfQs1QlELHxn
	Y1ouGGR/3tqN8ojHkqnjfLgF1IK/OIqHS5RHdcpzFyKtdwoP5X5r/DCZUZc7krRo
	TrF6mHKpb+/bJSBB9lQ75B6mueu3BTq7z5yc+c0NwZz++6Pg9yjDbFLpXpQ6Lyqf
	r3Kw9FxVBslB7ggKcIkMB5xb+WUTynpy2x7FvKofWwRAWl3/GRlbBxbZe+GgePjT
	Mbt09jiAlfiu3vQQoWVZl7M6t0MRbDk++4xk6Ve2bL7nSUXvzNszozWKA76jxQLc
	4dWBFjc97K98NkzUZTIsO2Gr4ad7xNfm6OJuVZfCAGgLHQ4pp/lKwlVCHumQ9jp0
	40+4dw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw091b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 11:53:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36531a0f95bso1118713a91.0
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777895591; x=1778500391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=;
        b=A4rLOAW7OqAMwZ/cRLU7vM5vYDMY60ZakgWHl93jQ3yB1kg9kw+NV9Sv/xRZYhKGWO
         7S3rQ9bbSdn+dPGuW7C3sJigypM+bnfFcjm9/fF0D5yq/FmlZFI4Yg5P3Y7lXtsD12Xa
         rK77R8NBG7TSeSCDh4MBdE4gMa3NapwEyijECtCHQGGs0tPQX/ejcgJYoBL46n0ZGWCT
         At6eQ9h6JSntz6DDHvWc+dfIyHYT/TsFK3PfTCGxI3VzOWoRRD29KSWzpQuGwYPyTlq1
         REGJyspedWxohOpST+51Xuo9bvbNhxVny2VyadZHrtu9IRUTaUDP/KLpBL6Wux5c5f1E
         6kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777895591; x=1778500391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuofvOz/5FZrPdq3bPa3pWgfvPCVCJgpGjMM0k7A5g4=;
        b=AqpAlc/G+R7ZgpgE01It5iK/bz3Yq0p+kJRCOMiBJTewnwdnCJGNab7USbxVkmWQfQ
         4yrACqoEKmixthtR//GDAkUqSoloU0mpc+3adZukZ6IkiwdhcHUn8qD1ZR2IUnqNOai4
         pWL01rCzd6YaaKWcd+3qMMvcazELD1i1ckBM2Q9FSX63xG29rSazP+eOFGrNbCFcl9vo
         vyCueeCu2c9o7BS/RNN1nFu0Poot2yMsQfxuMx6puCSoieGmkCle/YC6hkN+xq1RaEIo
         kivsdTQp64/HkEIqjz8aGKZQJsrruSuEp8hobNAql45uX4ss9WxZSkZzoQJ/4nDZvKmF
         lhqA==
X-Forwarded-Encrypted: i=1; AFNElJ9c0f2kskvawuYtSU50tzQKh4Zhp2U/XPMIPUZ3ZO0PfPCmN2GCI8LiqY+vHfSmmtyiXk2rnlg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD6skfbZNobZY8aGQX9rd90/VhRiEtzRPcuXP/8H++nYPVzrrH
	y4TtQcIbi0ev2VkOzofsbmqJPclATmpg2ZhPnccCnBX5ODzgu5ppl0YqTvXr95Fjd8RdFm+oRB6
	41e7LXbPWxfP5/zZlGf9/ql/gG2UdZdOjLJGSjeBvvlpCPHTYZw2yrWqZfkCRF+Rj
X-Gm-Gg: AeBDiet3+du7biVRLr1lJiHDI8FIUezO8YxnyvS0n5e3D9RgQCwUOQ38hKtEK6SVtMy
	sCkmasEtlU7SIPbF1+xTP6QNTWOvzDPAv7D2pm+pVvaoVPka4sROB/KfwjyKzG746y71+nEPgoe
	wvAWvB5K0I6IKPkqAWQRyIjHR3DZKa4nq06T1nkv8QCZsl5LuJhqNVg7AramDQR0H2O4EIL8uvo
	ygm1+3L66v8ZhFNBqRxDkjtSXaThmM6YKQWlxnvjaN5lLv1tUlOmT8id2rCEs+qZKON3AaoWDww
	3ZMobVgcmN9gN751I3N+As67zlcP9T7SJiJC17IJ8xJUIyzSabGTr9EYgxjQYuvPxCo7R7UuKX/
	6UP+hk5/7o32RwvniRUV/7Kg+3QjQmuy4S9lL+mGEOB6YIzH/YL0JXGNmzd8a4xo=
X-Received: by 2002:a17:90b:4b90:b0:359:fd9a:c50c with SMTP id 98e67ed59e1d1-3650ce4793fmr9409789a91.22.1777895591053;
        Mon, 04 May 2026 04:53:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:359:fd9a:c50c with SMTP id 98e67ed59e1d1-3650ce4793fmr9409732a91.22.1777895590521;
        Mon, 04 May 2026 04:53:10 -0700 (PDT)
Received: from [192.168.29.116] ([49.37.150.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec02ab2fsm11431599a91.14.2026.05.04.04.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 04:53:10 -0700 (PDT)
Message-ID: <6515558f-99c5-43c4-9141-4bd4a2be6317@oss.qualcomm.com>
Date: Mon, 4 May 2026 17:22:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] firmware: qcom: Add a PAS TEE service
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, op-tee@lists.trustedfirmware.org,
        apurupa@qti.qualcomm.com, skare@qti.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-5-sumit.garg@kernel.org>
 <ab4b5257-92df-4201-ab04-436ab77b2fd8@oss.qualcomm.com>
 <afiCrIYSm8AK9xn9@sumit-xelite>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <afiCrIYSm8AK9xn9@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f888a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fKl8XJY0368M7tBUixYpxw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=w6fE4RYvq4DoGGcOsJAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: ygNnlfvmNNgHJCr4uF08bFvUkoL9Q-uL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDEyNiBTYWx0ZWRfX8rXZZdMROwYu
 1oumJxndws9hayUWkO1DA1lofPg2XUgs9D9tEy2uULc65aImKtPrVYz3QCyO5u49RVQAQSIEWfb
 my+aTGZl+ZzoMqzo3fRhRivfHi4wiE4oJ0ornUz70vub0FkNxvhuQriTZH4/WoTfyv++3qBxCQx
 q8mzv3KY6+ZKg1b1YxsaOsFO6Kgl6JLyhoZGcim7SUSIWxxVZ+2C5h71IlKsRSuc+39ihO1tyWM
 0aHf3H83aO/MgmuCCq29xfgsXRJz7bUz8mCjxH2n27cRg/H/Q/7XWQfL0/Y8B3Dr90ekA5AxD4n
 k+cxBA5YcGAR6fT0cuoN+cj7Jz8aHgpz1mhWHouJA4PCPmFWD8/mOHUVgVChMnhfpl6yqO1ejc/
 KASNYA8cnWiM4PxbGzDfybMzP4O8+VvdGutW7yVt/6sarBdrfSaXTb1Pc8e1zTAOlnK5B1M87/0
 ZPsTQ+MBJ4HtvfKd4dA==
X-Proofpoint-ORIG-GUID: ygNnlfvmNNgHJCr4uF08bFvUkoL9Q-uL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_045313_491017_77A1E682 
X-CRM114-Status: GOOD (  18.52  )
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



On 5/4/2026 4:57 PM, Sumit Garg wrote:
> On Mon, May 04, 2026 at 03:33:06PM +0530, Harshal Dev wrote:
>> Hi Sumit,
>>
>> On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> Add support for Peripheral Authentication Service (PAS) driver based
>>> on TEE bus with OP-TEE providing the backend PAS service implementation.
>>>
>>> The TEE PAS service ABI is designed to be extensible with additional API
>>> as PTA_QCOM_PAS_CAPABILITIES. This allows to accommodate any future
>>> extensions of the PAS service needed while still maintaining backwards
>>> compatibility.
>>>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/firmware/qcom/Kconfig        |  10 +
>>>  drivers/firmware/qcom/Makefile       |   1 +
>>>  drivers/firmware/qcom/qcom_pas_tee.c | 479 +++++++++++++++++++++++++++
>>>  3 files changed, 490 insertions(+)
>>>  create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
>>
>> [...]
>>
>>> diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
>>
>>> +static int qcom_pas_tee_mem_setup(struct device *dev, u32 pas_id,
>>> +				  phys_addr_t addr, phys_addr_t size)
>>> +{
>>
>> [...]
>>
>>> +
>>> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
>>> +	if (ret < 0 || inv_arg.ret != 0) {
>>> +		dev_err(dev, "PAS mem setup failed, pas_id: %d, ret: %d, err: 0x%x\n",
>>> +			pas_id, ret, inv_arg.ret);
>>> +		return ret ?: -EINVAL;
>>
>> Following the example from qcom_scm_pas_mem_setup() here:
>> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/firmware/qcom/qcom_scm.c#L778
>>
>> I think it should be:
>> return ret ?: inv_arg.ret;
> 
> inv_arg.ret return a GP TEE error code which doesn't map 1:1 to kernel
> error codes. The client drivers won't benefit without having a way to
> decode those errors. So just printing here can help the user to debug
> any issues.
> 
>>
>> This way the client (say mdt_loader) knows what error OPTEE PAS service returned.
>> I can see that is tries to print this error:
>> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/soc/qcom/mdt_loader.c#L286
>>
>> With that,
>> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>
> 
> Thanks, I hope with above I can keep your tag.
> 

Alright sure, makes sense. Please keep the tag.

Regards,
Harshal

> -Sumit


