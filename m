Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C277CFCC07D
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 22:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=; b=q+LyBp+QA1fLN2Ka6iSq8qcmla
	uqFywes+gvmdT6xxDD6SAh6LJizgPicyTf6Jof5UNuKpaud3189Ne2tgfmjmCelVEIu6O1LU4DdW5
	RNOyUsBNOJOXda8o6GvAvD+EexNozAM+dN12japv9wGCJOuogs9uOMUTiEt2Ud/HgeYzlQ7cq/u3T
	qi+CpAQZShA8+JnxtSowUV01AQ32IAjnBl0I/OlFXtYrMEb2iIgVjkaV0BX0wJ3ilhhoQhM7QcomX
	2E8/wjKlsJyRLTuQRmsnCLFRLVZ+oLoOEdkwdWHbEHJ5+WhenyWa5F8RFfymvSohYbTEWDMXyt/kt
	F08i8O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydT2-00000004a7D-29pZ;
	Fri, 06 Mar 2026 22:16:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydSz-00000004a6f-0PRy
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 22:16:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KX4CJ232975
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 22:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=; b=SfSjst4GB8hij3Ya
	xumyToC4COQ43yIm2aQSarzCnpo0ypGv1UWid+nyf1aAiMF0Mu+lt8Jlnh6wZEzC
	z4nAMHqTQKPfGzFi4Ldw17z950DNAf03OiMcQDe7wwE/yO+WD8U5uSjNlAz+xe+E
	DI126rXVobs/QALLHK6ZUrp94YQkgg6+6YV5FIgosf83knfO3y+5DeVGfbKpw505
	0N1VQxl+B1ZgE5cgBtv5aVouUiY6VafcBs3QVFZGcpXdHBxf4sdQkDacB7oeO5Xn
	213NzZUpLBiKTugTF1ByolEGCHvJCbJb5CxMg1cmT9VYtIEhF2oy8+NVVw03lLlg
	Bzz1rw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2up10cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 22:16:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be55a1448fso5603241eec.0
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 14:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772835376; x=1773440176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
        b=inigKVbXDa5C2HsPMAVut55zhUGXB/QKAEHOX1sFY7370FYWqjwxHNV94zti0q5aQ6
         q2RyEh9kcZ6Ggi5joNfvLNNcu1rzlzE4Dk+YpRm6ARoUCMXPsbPu4zj4zG7/7jYD6zoi
         03DHKVEz6oCbfD6Gmb78z0XFVp/+307KmURBxEwjSiqkelL8A2PQVK/XHB0lDy+8c45L
         SKJKSYwccUQhagBLUGRwGEarzK9LiHKl3ETHePUuRqUEPmWpQxc/iUGssoATbZzYczu2
         gWa9XyiUFW5kMtovynI04dt6BJz2LWZZKpZOt+tuJ2jBK+6/yGBtQqlylslw5ZXNCgYO
         6gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835376; x=1773440176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8xe+5eaNei8a3fpTPt0x8f/YBdZqjrjrkxNfSV82tg=;
        b=kLZOlKwX2/KWB6LRuFyZo1GV61nuyZyZMS2BzTeTXYZlaxfrcdMC559JEP8hg6HDkG
         uxpNeDoLp4SD1C5kdC5Sx5CcJvUdT9U4xnetsxxZlbEhOryh6o1ExqMQc0pjF+H58ZFW
         ab3Uz7lM+W1RSn3nIg8HwdkPFabJZNGdNdS7XIkR4lZUEotTTHGVyW8Q7KmHHNhg34Vt
         tuPqTpoC5DkqA8og2/J504nSUFdgm9otM9dsnAmz0Psa096vcFUW5nyMyTRUoxCiqCIG
         DIcsILXytwR5eLsFV95Tk0/gRroNI9H38tYyC4amH4o6caZzI49hEKSy+agutUdMR8Ch
         7FuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXte5bxE8ErRtFBYJrWr2jbUWOAewDIMS94KwRHXQfP8ndU+K0XO+MwUS0KbLrniiLIR3gpvDE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQIeq3AjHT74BYC9C5iFEMpDTzjlHhUFqaRfYhP+L+LUBpJ/3Q
	4nMkLNd7tDt+9gqiYE4+XcpIXbBxtWDBDnB2jJJTSINOZXIPvaGe+sKood/13sMWUmh7XhWfKK8
	c746SSV5cKQCYTuObPFq15W8NbI7h8qMHTof3GxoezG8lpBxtju3y+hCzElXF6m8B
X-Gm-Gg: ATEYQzwVk/v5haWGDxz+2ZwIb28+k5f+AjPkoNyGXJsUGxvjJUWgbh0C6CBaLmBeaIW
	iigoMhdRY0SRdAjc/1cD0ADh8oGmJvn0YzANuH4A174kF0YNdQIao6CqYIKn4ngc2eX/oXqobqd
	pHFkGfV+e9XuLnoook8BiZJUjo/mzMkxAATLWsimbc0e5BKATnXBeRHHGAsYX5bxMnHN5cywQ9l
	Fl+YJf8e/ujLIAkAxMaqiKkfoYL6ujwuEqWwf66RYzhNubWd+YS6kYDHSStfacJjDs+tQ/MwBbZ
	ZCXJt+812zunQeSEzuV0woady4Sd1vwZPkQWy6pI2eRVzZKTD6UAx9v4B9ZHDokkCHK8yXIy5w+
	h9tY1eDyyOcrIPLZd/ahGkRBTVfnQ7dWiyA8e/fJozqt4Rjasrdol9CznzeEGXrOSO8ft7iTaS2
	L+S160
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id 5a478bee46e88-2be4e0655c8mr1446273eec.23.1772835375686;
        Fri, 06 Mar 2026 14:16:15 -0800 (PST)
X-Received: by 2002:a05:7300:641d:b0:2be:1b95:2400 with SMTP id 5a478bee46e88-2be4e0655c8mr1446255eec.23.1772835375083;
        Fri, 06 Mar 2026 14:16:15 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f94823esm2301765eec.20.2026.03.06.14.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 14:16:14 -0800 (PST)
Message-ID: <f825ae05-6285-4d10-9d66-578fb1221495@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:16:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOSBTYWx0ZWRfX/UHqKjyINHpc
 8ZeItWhM7MEERiLuociK2KOkw59mUMfwwxeFlrWcbQfJAH1I8HGrjIxn5hsjhiimFWZbAg5O5wC
 IlUuTi8LplIaGQ/sGUdqjA92KTOOvGhySVIQ97GflVbQViPt2ZTwLRdzzOEarWRvihYZ3qKs8Tc
 DeCCGcA058iZVsOrCyWj9o9jR7GWrmijh2yHoXGCiKJLS9/h5tg4sidW0Cqg0XFImdGgnIoI37J
 TTEarTGhBmNAFBX/1e2YZ9hOGEk+LxfFpX5QxcYu/CVzVBFtGX4ANPbSpPg5waafQUvnAB4denF
 +SpxMBu4BaklsGIY3HniLYTqicmhs+Berb2pAlGuNIdUI1fLD4gUyuf0T3XAFIaB4lwj+nDaAxc
 dU3WHgUFdQFI5IFNfAvTQpqeBKg4QBdysc6N80IIZrqzt66YYucxfmZq8wX1VnPWdTD9Y/zej3y
 4M0gvWGmbL6K8pYO3uQ==
X-Authority-Analysis: v=2.4 cv=QfBrf8bv c=1 sm=1 tr=0 ts=69ab5230 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Js8INul6CuAu6eKS1T4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: RZLWlIdkRFomiO9JKDHUvJ-d5oBJ6uba
X-Proofpoint-GUID: RZLWlIdkRFomiO9JKDHUvJ-d5oBJ6uba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_141617_171838_5DC74D4A 
X-CRM114-Status: GOOD (  13.41  )
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

On 3/6/2026 2:00 PM, Jeff Johnson wrote:
> On 3/6/2026 11:47 AM, Trilok Soni wrote:
>> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
>>
>> What is the convention for Qualcomm authored drivers? In some drivers
>> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
>> clarify it here. I prefer consistency here for the Qualcomm submissions. 
> 
> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.
> 
> And in reality it is very rare for a given module, over time, to only have a
> single author. The git history contains the real authorship. So just for that
> reason I'd drop it.

I agree and that is the same guideline I follow for the drivers we write
downstream. I just want to make sure that we discuss it here. We may not be able
to find one single solution, but I prefer to get consistency for Qualcomm
submissions. 

---Trilok Soni

