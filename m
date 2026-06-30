Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205C2C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=; b=ePHxqOhyAdL2RE00Nu9Q8b2eXm
	Xr39PL2AfGXT0EWCstADPQzCP+6WoM2DljRh9zO+uWlGWhCQzbBuWcjeRQer8QmmF/ThR4oN45AdW
	SFxKpMYQLo+dosDKaYjOv0yvoGurYG0JqQ8QlppBN3ZA9Y9PmCGVemx0PDohitp/QaYoP6skko0zj
	TPB7UElejgEIe3d3jkiCg3cYDpqnJsBHQhiwMKEFrHvewJeNwd2XyBBoMsB5INTcqZmbL0houvoCC
	9dB9ShxNMvTITq1QOrh2wp/MbcettYc80pitLG5mk9w9BHShdRslqiqam6tz21BLTqTtY8wMYF9Wq
	rzGzVDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgC-0000000GzvE-3cgn;
	Tue, 30 Jun 2026 12:35:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgA-0000000Gzu9-2xbu
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:35:07 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDZM1590639
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=; b=KKnkbgGqOr6Axbi5
	m8AFO+/Jphf+KutD3yzjJBOBGMRnZBe0xFfEDCpHsmiMPqrNjMgEqDLg5As+APA1
	d8qxQEA9OWFnuHHrcNzvJN31S1kOhgBbhvh5O/v/NANPH686ogZ+A6f0Jg11XSCu
	L6oDMxUpi66Stm8pQ73m5lflpH04VKTeKA0zFa1EGW2Iuhg6ljJv0qoye7xW45Dd
	HGtzYmxnVhiXD4HqcQrgDjuP53UqQiUinbMagr+sEQrcnIqU0lXA3SKbPhm8FgXS
	fJ6ZJJDxasvRRXyPxZS1CTAR6hpiohrzlxjtTBOBierePcL5Z5NKnDlfpBqAH/vm
	wze8qg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3hra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:35:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8ee253caso5215121cf.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822905; x=1783427705; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=;
        b=gMFX2p41hHDk/7MSo3kNPM4eaZOed0JIFhrqly4la4ZrpfvPGCV56/OwuM8e+rGkbn
         qPxxjrsTRxShnR9QOcqO8b8uHFU6DVVXb+h0MlGzJ2Cq3JctM/m2686Bqcm6ykWYDigU
         9AC/lIAW8g8cot50/sLH+X2H1GZBg6468DFB22ZxzeAVuYMGyng5mGYy2jvyUUP3cJjw
         fmONro8guCVbzqeqVoJSNq7XWs86rhSiXWoGp+77R9sWeTInH+arX880qbI5RIp8VPpb
         YcweztnsdpoIIu0/1+bHtLNiCq5Gv1MXE5bBqUFZZYoWh6r0GO1XRa+q1vG7zF71Pg8J
         QjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822905; x=1783427705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=;
        b=Co8zwqLqJGkRZ8lFeqh32bSDLKGVg45n9hl2qgi9OjUHGR1/gF7RGIeldBPS+Nulds
         nfSnNSq8YJ6y4SKmD54T/dYUyfmXUHg+I3MXlK/YS1TlTB+kPfxwhfJTQIDpGIDbg3zG
         fr6C3DEOdih5TCIRLNBO1BhLmU/XD/p0p1EkxSZPz91MP8yJhaxjDpvQ2UMGS/8lhqQM
         nnw02u3ofuFHde3tuwGA4lpQY5bsZJGd0RY8ajuhT8PQSf55g09QXUvPlNElWhyyJyVY
         MPHzdf8cwafeFGhTTbbdwL6vU8V8Bg7fOZNTUPN22hkX4OLdV705nHn4gsdEwSj1eWWJ
         EZKg==
X-Forwarded-Encrypted: i=1; AFNElJ/JFxhg0pyG9tkwuRrIPDtxTxWHaroZSoB5S4UWjHMssOEvIz/sceeBRdHDckLuaQqnxfmkkJ0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyle5/+1omjhXxkmm+Y1w5wokfBxz5rEx+NSxukHIy2GNAsAiQ3
	7wW8D0tkS0Qtq+J7cadBskSwxfbGjbDjTlGCpJrMIb53KJYRZjmrLkQ0HkyRGy31mqjmJNLTq8H
	UPJxGxe+VzuDl+WQ/citGEmCmz+DbOjoha1gkd46IjM8ojygRle9xTXXdxDtMhhPD
X-Gm-Gg: AfdE7clH30TdNjKA8FWe5voNhwwKAZdWT//vkbUIgIAD++taU2AkUNyGun7dOpmLHJL
	9Q4r5LzwghFTN62XP+VJXKvNBTnSH1uwn34BkvMPNrwCge0koP4Lsn4gMmwku/v68JTB1sNL7Lv
	sxRQLf7enk+KvntxjGDr4O0G14CTYwC62Aw6x9CvsIiJQfqo127b8IzMGl01GqSdmSMUVgXjrtf
	/LF4d5jbwK2yGQh3JovJq+3cWM0j2MQs8w6DxMTrRs6ENIqjZswi7ZYfn2rEdEvTHeB7grwsZRL
	LSDT/AjB6FmsPvDwbP+kRZRUH8Qsab2NqIYNG4tpib0YHTpe165isPYEPPCbvvT5RRm4IxVi8Kx
	lkf4p+uCWBljXygYRcOxQY3jxUuudtk49pUI=
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr12929211cf.9.1782822904823;
        Tue, 30 Jun 2026 05:35:04 -0700 (PDT)
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr12928611cf.9.1782822904391;
        Tue, 30 Jun 2026 05:35:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm117506266b.51.2026.06.30.05.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:35:03 -0700 (PDT)
Message-ID: <594cf827-819e-4262-9dff-a35c7f69f86b@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/14] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX+2NzKFvbYFh+
 0hDVPJXwDG2rD7qr0Nu6NpIaxHMGqQjaaXNqbuUHEjO/m98OunnW2o2IsZ7bSS6lHXM3NuPAKJR
 ArmXxqIpikYLsx5H+wQiZPgzG+Rha04=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXzl7opGAbcjqC
 rLSdNfz1au7dn4bzirJPxHjugk3IdzfVe+ABIf/fy6hqOI8x8Ru11ibs2h5Dx0J0WuJw4Ya8q25
 zDfhhi+QwohxaWbTH3SV4nj9InT3UPVqXJyeQwYqjYDtpO2xPcq4+G9bWws1F6cCfCfAq6IoFGK
 Ygc6TLD7J+tBQjvJBqgLz/r/0XwTujhAzWYM82xERLgt0cbbAHTivmpEHQ/OXy1f5oHFAPdnw+9
 Q0SXDjzNfWuy+L0i6fA5FKuREWF0TQT+hX27QUu/xeyNCxV0N6/JAnJub5L2tMQ0zjDhQYUs1FL
 bCL7JxSrebv9bQx1RLjGuqUlCFkV+0QMF8tuUYh8V9h/3QDstiuPfH9JMrxVBLO10lBq9a1GUhE
 DwLPwIbop0NzG71+n02hsuwE1Nm3NXbZkw16pLv+w50qMMZ6lllED0VQKCRCSbSiRLEvv+w2H4r
 /rSBU8xjeO8yI8C7M7Q==
X-Proofpoint-ORIG-GUID: a649TqiJ_jb7Ajuj8zbgZdcJgudnu22S
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b7f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JRhjOG_OB-XQkuSI_8oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: a649TqiJ_jb7Ajuj8zbgZdcJgudnu22S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053506_867879_B3312718 
X-CRM114-Status: UNSURE (   9.99  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_pas client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Since qcom_q6v5_pas depends on MDT loader for PAS firmware loading, it
> has to be switched over to generic PAS APIs in this commit to avoid any
> build issues.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

I assume that the leftover qcom_scm_assign_mem() will be handled
in a separate effort, presumably through something like FF-A lend
on the backend

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

