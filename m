Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597B9CD3427
	for <ath12k@archiver.kernel.org>; Mon,  4 May 2026 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=; b=Xd8kfLkl74MocJ+gsxqCPI6n9P
	WWwXq8jWKHBEbLZl6JjuxgAT+acZbea5VzeLtZSdeQe4kEHX/8Fr9vsfe5UtPVgVx+/r1+XYCVrbp
	grBVVpVqeNN2cXl5SnuSWSEu6j7Rlvd09J96Tdn0OoXZKTtUZWjnJz/fIFTojwboto+umum+faCPT
	/mxruQM1oxGt7uEAA5tbaBbGl9AybI/d2Ca08ixSJQqXhvj1DFKKyHU3Kiw/MQYh+oYEzrsyISInA
	30Tv5yxFogLzibWuDAJelTvgzlo2P5xvAaiDoqFZToVJuc7xmXGAlKHXJwXUhp3ZjMTFlUyMipTej
	Nz1Cy3Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpVj-0000000CoTY-43Ye;
	Mon, 04 May 2026 09:22:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpVg-0000000CoSy-47Gt
	for ath12k@lists.infradead.org;
	Mon, 04 May 2026 09:22:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fPSY459372
	for <ath12k@lists.infradead.org>; Mon, 4 May 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=; b=jT8UcqmQQ7n8kYzv
	d916VXBnBVQAm78wuEtAHyF33nuIfU7O9muUTVQLHdQqRCsxCnXUQgbmZ0fXA0qg
	VmH+gx1lXTg64WQaDkXccTDHvTbf9NCeimH7F3QvzoHpBClvIZjBqcRFZDiaKgiv
	5qcakwNqNRUSy/wv2UxnUomasVoiBjozKqMsvBe0/7eJysYubnJaFJGtT+FNI9ux
	OgE/dxTSRubj28Ew83LknbElbkH3kqwyMivwUvQUpW/TCMdouKIirLws0rS6Mw3M
	Qt8JuiFnIajoHlvcRdHSE5t+L63sURsDNn0q2ML7g9KvopCF3sLVwS/98cB8bEpv
	u27RAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaejn19f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 May 2026 09:22:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82d40278103so2311494b3a.2
        for <ath12k@lists.infradead.org>; Mon, 04 May 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777886560; x=1778491360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=;
        b=ZBCDOml/P6uHht4l7n6bOcJjea+D6s6dfFZ1AOI/F8tZTeuc4+Xf0iMsPEYBaCEkva
         7GT7k+2voRn9Ob1nSwl5mBb+P0PPnHQrXbi6zFsjwpDzN15Drlvg4zQTGardS6wBHoQ5
         VpcEifbg9Cwf2UV7QI/z0y4xtbAmGOZeVbgPwKXKzW15i+SAZjOypE6k2A1MtZCI6ll2
         T848tEIAxfcuqAJczLYfN0+JoyjU4wp3vw33XqXq75zHg1Uq348gdNhmxZlOJPFCcKZ9
         xUOhxNLGw4g6EymRpqklJOieH+X9b6iGnbYL1dKKj/e47aCcGuwkJc6Fc1rZVedjGfcg
         +8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886560; x=1778491360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+gQ2IYd21NQFildd15TvBHWeYnVzvUERn8F2hMpH7o=;
        b=ri5QQxLLAwTweqEumPopuITCH9wbIuCgT/xIvrcVD5PtIBoQOCxfNwPoCVQrESSNa2
         JZw5qBJMrMeuE3ASKJaX1Ftaxn3nOjkIXgxav4rkocsAGw1W2pHXui4RfUcVEWxU3+iX
         dIfxy3aP1aScaiqjKnbCo85XURdMuBwSkEo/ixodYm14noT1QllOzHwPwxCA3efQE10Y
         MhRPEyHWI3vqY2ntFnWJHKdK7mLvvlsAa/9MVWhPi+YYYb92i/6lqY93n9T2/g5if7vW
         wR9kb+sso4qS12GCCOWYU26M2ofsfk71erxlV0N1nF1+5KAlnFs6XOpb2nvCdZZxpaRj
         xIBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fagRDdORJm/l9yC7WUG2LLVjBYfjVkxg7e7KeeEwFWC5Yk/TkONzQ2VVaCSbkIr/vnX4Ow80=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMKd4F6mVwsTPLAypb8GAZ7QKuqTCmRa/RZkMUh8L041gJHG3F
	Ru5FrS3IHBcnhzuHERK37wyRTQP+HFIr3EIvlYu2YzJrmgRgf7T43jVOtW3YvrLMA3YqI++w7vH
	x7Uag6RLCbslSaHq3D4yBG/MjpXn2LEoC7WQwpQUK812PJis7BiYT2C3OtbJaAlWM
X-Gm-Gg: AeBDieusHgEPLadUww5k0t9ip0mFd63WyI7/onfPEIDzsI24FgqA1HOSCRU5KjzmgTA
	dKD3H0cKfzg2++mT0iP4ZGE8ZOzUZH62xK2sMbj3csMsRc6cQRjbsyLwxkoRidUDHLK3xQgVb8f
	2f/4tMpQ92HIAYRc4VTlrAwUknK8LX6miAGRExCjwQN65yeknNiDED8GHFe4CGE1i+vc+kwldCn
	03/eIdK3sHHS1zigDrSi7gmgpiwdKfBxH9YsK/pSp+IM1IcLOAbyDoEYD34uGV7xfrjXNF1F8sw
	LzwvC8AYw7Bjg2f0S4f4vORcJwOoEAE8fY4c/POIJlYrV4mFkugm5jX/DHYu8DFRKGQrjqk15le
	5bepaRi0cT0o01RzgnqPjAbWk6NPUNDoQlqLudHtK8uwx1dm/iyYk0aoK5l3rxQ==
X-Received: by 2002:a05:6a00:3c8b:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-8352d1fef20mr8936702b3a.25.1777886559718;
        Mon, 04 May 2026 02:22:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c8b:b0:82f:5dc3:b376 with SMTP id d2e1a72fcca58-8352d1fef20mr8936668b3a.25.1777886559217;
        Mon, 04 May 2026 02:22:39 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83775b1eadesm3030462b3a.56.2026.05.04.02.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:22:38 -0700 (PDT)
Message-ID: <ba8c170a-eae7-418a-aacf-92b394c401b0@oss.qualcomm.com>
Date: Mon, 4 May 2026 14:52:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-4-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260427095603.1157963-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA5OSBTYWx0ZWRfXxC9pt45wl/2G
 H+wnOLO5vtoBNpwwpO2OZCbnJ16d+qA+hXbmPDRfzdHRSsjVY/7y0Jx6fPm7gYSu/usZgS5nKKC
 xfBBVyslG2CnDL8PJzRanmboBBF1ScwvYf1RFRNdz8PHiT/jTnr51XE1ib5qdcxMHC+2viruIl7
 2wQQ2t/q5ZJJJiPOfsP6DXm42zdWQBApTMqlMPbOurEDS7OHPk2jUCFe8n8PVdv61enz3jq+hfv
 xNWHJMqWqNuoqTlQJGeXnYE/JTZ1hSvek1oW6hgljrI/YxbmJmkfKfEtjgq9bhhe2n1oKiq1ta6
 t15NOrbS37qOTbC5jasr6jmjFhdXEZCCR3gHlHDJNzw5akuGksJGfDyshQgieed0LHzRcTE+Y/O
 f6c6yBz8LA6wC+C9nrUl53ub8mjSGYJpnj6KRrlRPUFNSTpj4/1m/ovDGMEU5TGS/ANO28uFHD1
 7qKPU2vngu1wUXDHdFQ==
X-Authority-Analysis: v=2.4 cv=Wa48rUhX c=1 sm=1 tr=0 ts=69f86560 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=58GAH2X6W2vqmnVK_tYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: HSgVa8R4-5MOCapoAEGjwsPQce43_6N9
X-Proofpoint-GUID: HSgVa8R4-5MOCapoAEGjwsPQce43_6N9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_022241_126477_0D8BF195 
X-CRM114-Status: UNSURE (   8.84  )
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



On 4/27/2026 3:25 PM, Sumit Garg via OP-TEE wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal


