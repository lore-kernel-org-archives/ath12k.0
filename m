Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA894FCC9D1
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=; b=LXw7TnewFZfykMDHxB4K5zzRMY
	8az5Wovn5XGeyovWmVc0C/8yzTlBV2NHrw0qTbIMTmyvMKYH4Hsp3gW4TxxbujgPI1kayVuyHKq/4
	UuYblrDS6CA9FZgxfkmEWDOjSERNtg45l/A6VJ+2AJU6XCUJg3k5x8aMqjLpbYBfUJO5zlixYNid6
	IrGCDqYADZv1b1FDAnqWQOdZJ5HA3CiTDuIMakU7K+yuVq25j3cAm66QoUVY1UJAasqH4n/heWGM/
	JBFS52wGVOm3quQX+Qk90xypFTchdx0a+m/8J6O3EwHywjB/puVCeTadTd9flVcyk8poy4f20HW+C
	/tGyEuag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrbI-00000008rAW-1CdG;
	Tue, 10 Mar 2026 07:33:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrbG-00000008rA9-0se6
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 07:33:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EZVP1900138
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=; b=Kis8Ct9GRpNmKtwJ
	DyqBDWDrEjtOX6ie7KU2k4gGiK6S1xJnr/EMX8A09/MbLt6LYEq4cHuVIFVihy36
	hvZ8umOrJM2qHjWLwwBnZ3ME5SUkiQlmBnwHw+Fw8ZW0NAWQb2Fj9m7I3GCbc8z6
	B1kiQa2ZhdvLozL49xc9r4EArybe3waENlPry+rHf0tlU7vkPmHnm1tFbHwGD3Q4
	5LQl24b92P0mP1QvwbvaR8TXolpX7F5C7a42euRwpoVmvScFy06ftvc1o0cIetmk
	skOJToP807conUhcupSLAlv2eGl0B9Y/7bdYqn/673W6OJZkkHPjgEIlLbK0nPmH
	OT+mpg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsac6ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 07:33:51 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-466f705757bso9500180b6e.0
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128031; x=1773732831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=;
        b=DXBhlJpKyHFOfd1mCKW+3M92Ar8LCGiqmQdwOUt6sGVgka1ptLtaM7z9MGApBOEkOe
         wWXvAm8MmLRmPNV2xEYKivALqKGI3s4TtP/dc6q/eIOpSUkilE4CQez+9eNxa1Z+B4Ly
         qDsChYu6MXPq2VNmyHobhj/Tq5nnuelQFO91SeYnFOFKLbqtde8Z81DdF8S73zg8ts31
         P+IAJHXZLsnJWUztEIp4jjPqfp1hBHZbMEpQlGXGTAon/kbbuupfs7gecwuq5Yg8FrD0
         qklg6rfNgazsmRyTKIix+ezUC9lIiTF/+/2KzdOlJ9eTG2SkZJvpRakyc9W/K41hdsNX
         CBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128031; x=1773732831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=;
        b=OYL0LwXZoZ8RqItz4IgC9AbN7+8PGHuCNpHhWp60y20chG8WZi/lTN3SzTcld1pv05
         NRxsDkIHwfdWFvlX5o/RGdbldVfHGqsaW0i33eDZ4pfVDg3/VoJCex3vnr8sPsJocSat
         W6BOsaZf5YgXZT1GvbZw/x4UsXPVgyFqk6FbrEgBsE6kzIRU/Dw/Pnjojha4xWwifK1I
         yMgKVzsJMujRVxiaZi+eerfgUsG1YnHW3UCRa8NLzqxZIDiiNWSCtD+asvNWBuviAXSR
         9oavFyUIxPGdUVkOYJbxgQrb3k1nuOSEU4uKhe4Z8wHzVRrtc1djYCwZM5WSh35lL9kN
         DYhA==
X-Forwarded-Encrypted: i=1; AJvYcCWvWmvotsAYxgP9Q9wwQhK9vrdlPtHty6Qk669opsujctUzypcegB9tU8zd+TYmG0B9lD10ayQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyPvIr79p7jQ1z7nQzFuaTs1wfUifqXmfXMFG02JkDvKM76SEX
	HnoUI3msYC0nOTj24T1AupQtQ1bKqCfsSwg2j7l+dREnjwinL4ToHES2IAUsp+gqPhGZ3I6fBq+
	gTvyNCaWCZdkBEDzoFmjwi7RXyRTTtF1YvyVFUSdGoniwf5EFi845sykb0uaB7ujE
X-Gm-Gg: ATEYQzzyQ65kt8clI2FW/mEzi0K4XQ4C/6HxI6i0LUZxYdrnvtPIXpdK3ab0hEr3/KI
	mTrW6xYB9IsKCK0U8GOQ9Vd9w87qKuYk5sEBOhwB3hY8MyZy1t0URxWCa4mmvwrGjsJibLyGq3s
	ZH/AsejgDvG7qd4S24YUcRrGeP+B2cdKE8+h9DL5ozo5ELfLofT42069wlFXd3+ZsBlc01Jhf0g
	2UIilU3I3zyXGzKqqA5dYioMuntCrCXL3Fd1b0lNAav595GM6Z4xYJyUvFc0BlUjq5sy57JxEb4
	eu+qbPknTdrNuPeclNrwzhXpFXwS7qZFoESEbgO96tVuLSkLtUvF2z+bB/O29UBF5Mtzx18TbCO
	EWFXzBaTgztw/xZa8ryOQkHTOHHN6DoYrpytXTXCW9VQ03mJzhN5HPrw=
X-Received: by 2002:a05:6808:1189:b0:450:275b:d942 with SMTP id 5614622812f47-466dca7e59fmr7695422b6e.10.1773128031296;
        Tue, 10 Mar 2026 00:33:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1189:b0:450:275b:d942 with SMTP id 5614622812f47-466dca7e59fmr7695383b6e.10.1773128030815;
        Tue, 10 Mar 2026 00:33:50 -0700 (PDT)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d755603798sm2041412a34.29.2026.03.10.00.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:33:50 -0700 (PDT)
Message-ID: <e0532de0-40a6-42b9-8936-933c31251d5e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 00:33:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
 <aa5qdscMRq7abfwT@sumit-xelite>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <aa5qdscMRq7abfwT@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a8JmpQ8tm8LnLGUpHNNT8h669x6wSS82
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69afc960 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zqicFvc7-s5f9fRnGKsA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfX2fcJCetiboFw
 5G6NMeGzuCIHjtQVA5PYMEmpXMEkTY46SRtAQfK2L9cziCYDKFLgMK464jefDoj+6d54BDyeJIP
 n6uuzd6UpQyURKPmnx3jYMRswNrv0tcp+vFkRf6mVQWLS7sOl67UDdiYPQuR8IeDqhxYACIROOM
 pe0H9DUHaj3VVc1sllQ4Rj1Mfo2CGd3/GD7a50msNtL3Dwp0Ajfh8sZQkimlnsER7u+j/j0QVWU
 FIzhdECskEd/b/ighrOIgM5Penpu8UwrsWyLnERWDrDzzMgHgBkvucdFADMYepCsofPtHF/O+05
 UO1qjTt0UpF66EK2T1usjiHjEjyRNbqSFojLEjaYppvY/v94TSTZvs3wn6PZv+91CWcMugDPnQ+
 AXxtKOpFgH7mBWeBN2ajq55jA+nWd4qzyUyBMTwvVAdjEVPznlGBfOTV3eImAnkxd3vVI3Q2Dw1
 VjpRNiRI6KVbEyR1E5w==
X-Proofpoint-ORIG-GUID: a8JmpQ8tm8LnLGUpHNNT8h669x6wSS82
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_003354_391899_0C73E429 
X-CRM114-Status: GOOD (  16.52  )
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

On 3/8/2026 11:36 PM, Sumit Garg wrote:
> On Fri, Mar 06, 2026 at 02:00:48PM -0800, Jeff Johnson wrote:
>> On 3/6/2026 11:47 AM, Trilok Soni wrote:
>>> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
>>>
>>> What is the convention for Qualcomm authored drivers? In some drivers
>>> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
>>> clarify it here. I prefer consistency here for the Qualcomm submissions. 
>>
>> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
>> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.
> 
> As I said in my other reply, it is quite subsystem specific.
> 
>>
>> And in reality it is very rare for a given module, over time, to only have a
>> single author. The git history contains the real authorship. So just for that
>> reason I'd drop it.
> 
> Sure, but you would like the driver author to be involved in future
> maintenence of the driver. In my experience that's how usually the kernel
> development process works. If a separate maintainer's entry is fine then I
> can switch to that instead.

I would prefer the maintainers entry than MODULE_AUTHOR.

---Trilok Soni

