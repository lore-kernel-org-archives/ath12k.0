Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B6FC87FCF
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=; b=V8+TKuH0AD4l3Qm8XIMeq7Zj/5
	jG1m3lhIn3nLawE8fW//z8DzpCvjL4mt1v6dXJib3odgrJ7sQ85kn9nQdIdqTJ63cqVRRGjDRhCm8
	RiPUJ6vvLObEO2ci+sV7RRtixpvNzzYmVrA2sKNdJ41+NHIavIPXQLUCKTavqXso7xx8q23u5qQ5K
	NruuF7TfAY3VHedCYSFinZPFi9dMm6/E4wuYIOWN7z0BuDHCS835AfWf/Ot78buYSwZWTqW2IurmJ
	kcAlFjA2jdyl+hdMmO2HgNYqqE7kEWeoTiFuISMkIEMEKlEl3T4ikuyizryt9ruYdcalGMxUnf9WH
	NN7Ch1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivR3-0000000AZEG-08cP;
	Mon, 04 Aug 2025 13:41:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiv1E-0000000AVbI-0h5b
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 13:14:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748NrJY030930
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 13:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=; b=dSBcPGe34hwe5cmj
	mNB3LlId72lzaYJtZSgzsodfASxhHgARWwRu90eZ1psCB2Cxis7dqc4ti5c19Bwh
	fS5Ol7nj6L/cPPs+hAdS0M3wuTukXxrxLvwdKWUhaKLuSfgzj/9XQ0ZXkaQ7CE+y
	TxJAZGADC6zvrzGWl+9zyEvsArtjZgCVl9c1z7tUMCfR/KC4VbZaNny4SVONspCj
	GO3WIoaOu0tLyRvMmtdxBoK0Fl1HxZkP8D7KTxc3htCsBBT2kevwoVjKQswWu9pO
	2Xjn7p/TxO3v+qi6ZnXmUO8ed/yL0nckSKO0rKjMumMPR60y7lltL86OcGSro+2d
	1BbibA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke369g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 13:14:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e48325048aso90789185a.3
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 06:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313262; x=1754918062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuqkYJEHU46HSu5bF/1m8NgiJsyaKNVDD5t0GtyZPKU=;
        b=w74E5cHixqoJXoT5H4bcQbwdI4tQ85pRHf2oTlxhtZTXVTY4rjy1QAE6JmG496O/BN
         JAwTMrZBrfZyfxE28uRMo9ri+zoO6a0o2hUmr5v/Xfwsylui7cJkDEjZ8zxkqMlQtgBh
         6zXR/LZb/zQr8tlDSXZ5w0N0f3gqQoEmXH45ZsA26JQ1R9/J3W1yW4YMAnQYFsslPIQL
         kYpPGbbyBTviAsJ4TPegXmD7HSLkkjpMnmQ/lHGlWlIH8utsdKD071THa6gF3fHX5FFK
         6bPHa+AYLCVjGDH6oLlzRO1H/7gLlxnYcM17f5vobMa96kywkJK4KGq5VpufKvVntVDC
         3Xxg==
X-Forwarded-Encrypted: i=1; AJvYcCU2QJh8VJT7L6YSpMbUoyUN3cKiuGgdUz7HJZOi3fWxRnps3gM21p7ifRfH8CqCcnywBWVidII=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBnyCXjzf4stC/G6gEirBzOe5zZfKqt7gVzfQHOyuUTeGq2GDn
	Q0HSgg3igV492AjuL0iJXBFk1sxR6RydYq5tH66ALS8PVrG+2NF/1TbjsBXdGW3J+s6XFb3KHu1
	AZTY14PAj0dJwc8W7xJ4P0K+Ci7Y1lpZLUhYwsWhD02cTD7ez01QtyZcny5OMxx6P
X-Gm-Gg: ASbGnctIMAAVk4AkTrali/r1rRNxL8TV/pR7I7wIrTeWDccRA4VEFBZdGlLG8e4PbH/
	X0MiKfe34vbuC6F/1eA1gVhyEkoPi1rOZNjyzZ8juW7SWsqqlZvfabI/SDC2b/Q9NpxIPs6NhJt
	IJ8al+CaKn4L2zA5FVwPyxEuXRkcuMuedxZX/m321gwtabu7cgGYAN/oU6PKVPXYjKhv3Z9c5Ef
	6ZS4NBTRC7tGdC7cr3aHcRb3A0+9ULRuPDvLt1jcw/hi3unElPARJVuBAExtYR6mtAdM94Y79Ci
	4RdJn0LVUrEgh4PIqg2HgCFECkqTxZkh853D/Ak/VgBHPPNtZSuwJXpTRg9SD0g/2dSCtO+WkiJ
	sr0XJpDa2ti8viRG3pQ==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127005785a.4.1754313262046;
        Mon, 04 Aug 2025 06:14:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQKfXoAA4iQAVx7vrakGz5rhAfhLmMpyLiivrawj8ql8YqoebUHyRY/Z++bxkV80jn4cAicg==
X-Received: by 2002:a05:620a:40c6:b0:7e8:5bb:b393 with SMTP id af79cd13be357-7e805bbb656mr127000885a.4.1754313261562;
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8feaf2fsm6810919a12.38.2025.08.04.06.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:14:21 -0700 (PDT)
Message-ID: <dd278225-6680-4dc2-a0d4-e110fb2cfc20@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Remove unused parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-1-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MQplsq0MbE3JnStCxUU48vHXjmlZ2jtq
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=6890b22f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wXYMRSRB5Pq2Cuyld4wA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MyBTYWx0ZWRfX+DbjwdoSROhT
 qEzs4ICQx7fn4Ig8nWDg60rOPS0RYrMwBk5FmKXbk5f8X7ckQXf7Vv5DuF2DYvxZGYmyEPrNKpq
 cpIfBDCeFrEwim/O3PjYLDZdIU/QrwsUun0myYcv1agQ1PckmRl/lqeUM0CQypJpTdqZhUa7eRF
 YXMZ41aqU/eeHRGpiPLql8cc5M3Rgbn1+wX/bDXVUUQHdiK75UkNahXOafX30yUQLjOmmlgflD4
 vdXW1xjZUpal9H5CNOPHd6zXZTOgsng8tdSAv2fMFF1HE36mAg2L6qjBSUvMLYGRNrpK8W39p+W
 JtpyObCiyV5mBxYX4R0Q9RgdB8pva0vEoNV6eh80RprgRBsnVJr3bzq/6vGtqtDR6z21+iykX/2
 KmT0xfjqNYi3nFFkesJgJujgU0qZSnYPZne/MPWcT/JJ+tozo12tLGA5flwm0WkeFBXx7xLr
X-Proofpoint-GUID: MQplsq0MbE3JnStCxUU48vHXjmlZ2jtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=978 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_061424_217005_406D048B 
X-CRM114-Status: UNSURE (   9.45  )
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

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
>  operations") move pas specific code from __qcom_mdt_load()
> to a separate function qcom_mdt_pas_init() after which the
> pas_init variable became unused in __qcom_mdt_load().
> 
> Remove pas_init argument from __qcom_mdt_load().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

