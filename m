Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8759EC5AD49
	for <ath12k@archiver.kernel.org>; Fri,  6 Jun 2025 22:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAAJcQGkPl8K//dCoxaXa4s8/m31C5tv3RoukdeV8GE=; b=Ocxm5vrowfHMrDDqEJBni40gil
	WyfSJr5huEwll+sxW2J2gh54d1E1QL9SpeNrcDeqO0SU75UmACR/gPz0Y06npnJ8QYaco+fsxN9lE
	Mq0qf6K1Bta/86lPzAfZkQpHBbL3mswaoevDwrj7LdLJbJilQ1EUrYnQql7GAv5GiHfwGfn9aqidr
	I/2JszCvYfdoArWeuX4Preq9IyBE5mRN3zUSl2F2tRXa8RQVLewO+Uy0tnzSRGIdxGOCKlzgWBuHG
	qhL+mmlakrfd2c7X0afx434Ed+kxMpeQDXWFgPJFepkjp+HHEkMuWPVdb4CTm30FuAKqT2PcWHGCV
	2oagmyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfkb-000000014sW-0I2W;
	Fri, 06 Jun 2025 22:41:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNfkZ-000000014sA-0BLG
	for ath12k@lists.infradead.org;
	Fri, 06 Jun 2025 22:41:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9Mfv018266
	for <ath12k@lists.infradead.org>; Fri, 6 Jun 2025 22:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAAJcQGkPl8K//dCoxaXa4s8/m31C5tv3RoukdeV8GE=; b=GqhPWdbzyExwmmTN
	PEMUqlItgydG8g8uEP2T2nQlGcCLSPzG9qVyzbJ5POwkK1eti7ADvK87JLwxtTww
	6RSvnC3ms8biZ7PEvsdQcP8ibnad1ze1ZaYANwpEH4P87TPSkmhHTnmkdjFjtadZ
	QnfLJlvavjrcJNXtcRZnBUW2bzxrjUmCefFVbnHjWtEoXkC+kBcKn9ITXx5krE+n
	Gl4ngxzSdiNAceM8rv4GOwtBjc1Wy37rjbaw7Hg04fnuhUXnrXHy80GYNuPPiYU1
	a80sszwJOla+RR3Rbk6HLl6oisC4NxUxC53vd7F6Eo8ooY28lKHc6NN/gAXI9fO1
	JU1Auw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qdxum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Jun 2025 22:41:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747ddba7c90so2066865b3a.0
        for <ath12k@lists.infradead.org>; Fri, 06 Jun 2025 15:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749249680; x=1749854480;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAAJcQGkPl8K//dCoxaXa4s8/m31C5tv3RoukdeV8GE=;
        b=rdg22xE5ttOvPj+paHOGcmyAxaeNTII7YAxzh36kO6vGYatUaaICCus60uFmb3WkLb
         yNUIi8MMIhaB5G1zRyrH+RpRloRP/7kXu2aFWcKjqc7Ok2dipPa5cqcBQEfoUIebTy0U
         aWueELfw8ujDgUBE/p2DrbCMInfHUHdBMuO5afrYZXruLlbQc0tX1ljH4JZqkjHX30au
         eheffJQb+sjQk6i88HeNCTVOwZMNdh5sZjxkN3Ha1n8t66sZhUxUxaLlwpXwLeFlCk8S
         F9iNgmYK2dVWkPqXDeBFPadTk1UbvYCIzPZZry9YznmGA4ePJl36L1V+2o+3njOdkbXh
         zXoA==
X-Forwarded-Encrypted: i=1; AJvYcCUMG55McxRgKy3TpEtFUto4RLd0mFSxlR907ZSxn8uhVcVOE9ALTCWg2TIjjJoiZEs2NxMgFkM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxU0zvKUL4yfra8MMoiZ9yNxfOBvn9aEWA/XZpAZFo7OLAkxykt
	OOzecY0hNfzGGIHsDZwG1PO6GVDHwPvF7WrwzBUFFUyh3ml6fYiNOuaXnJwNKIuHIhb8bhEXuTr
	xwWaQRTPEK0jAMSyJyb+ngy+VX7dy9NxF4zjBs7twZVVzsMI06lY2heF9LcpNZfOr
X-Gm-Gg: ASbGnctICuSAei9P7KgbkU/sgtKtvtYkfh9UN9cXA93Y5639FXyYsbvxWMCMRVTREWr
	Id0u9TOe9EGMJO7B8aMQOiU6jMywjrPcgNHGqvkpTMKLxT178exyusUl0L63fTkkFM3n/aOOEL4
	BHYAMUOl966XXnTeBMtH9IWKKy+U7BgsTVFdD7EZ4j00Nz0QwNAd37O8J2zQevnmbBFzF7G/AaV
	zVQR4nTXIHgFtVsauQhgEq6qhfWqVj/unXoCkaolc3RYpHGpee2TdPzOLJ4HoUP83K1J97wUyS2
	JgZec2BpgR6KV5ZVb0s2HAOw37B7lZDBC6JkWOSST4z+94trn3bHYhYIadrlrj4fF6NMQF6qTnD
	eusvE3Qr0KsLeo6w=
X-Received: by 2002:a05:6a00:21d6:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-74827fd6127mr6917827b3a.4.1749249680337;
        Fri, 06 Jun 2025 15:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEd91O9hxK4Rf2haaI+9r4R5fMx/23QcCPyfvYCRIOwxVKijRGSggnmb5aRmp+H97ufV9MuA==
X-Received: by 2002:a05:6a00:21d6:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-74827fd6127mr6917812b3a.4.1749249679982;
        Fri, 06 Jun 2025 15:41:19 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3823esm1851236b3a.17.2025.06.06.15.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 15:41:19 -0700 (PDT)
Message-ID: <8b84055e-aa75-4660-a7fd-c10b721b47e1@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 15:41:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: report station mode per-chain signal
 strength
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless@vger.kernel.org
References: <20250210054050.656075-1-quic_lingbok@quicinc.com>
 <4c1681f7-c4fe-4101-8023-a50b4b59a17d@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4c1681f7-c4fe-4101-8023-a50b4b59a17d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Lu0P-03SX7W2JEHanQh5Xd65TCzPzxnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE5MCBTYWx0ZWRfXzt6TUmyYikrw
 xDYKzcOO6crXVPO95Yv7toYjX27yRvUL5V6C0MM66WjXVYlQjJryyYuRsMNv+k7JCuNffwM7sYW
 9mwRKEs0j8snR2vjAhyQdXBodUKSgCB8MsaHXAWg5s43XTyh9SLaCluF0qwUfa9d+nuLRrV0OiD
 KWZSdRFKxB77+wULP1EV8Ew3cZH1xxNt+GpJxf2icQCGEsdul+7F7lRkXfT0VI9PxwBkWDvPZZj
 6DRnak6IhSJL6YOi5dHsLHWzw8wP5P0ePh7MNgkjNy2jf0ri0OaZ5VzSAjyws/T9I82xbUr1GoL
 6lFwp8ApodFf5M6XmxL0aJfKUSRbG+AWsIeothCcIkP13CibK/w18uVMBrPTPRxTSF9/1m/LNxp
 piyGlLPlPLbjg/6Ew/DDTb8meSTEuOF8ndLEXoQSxuPmOfrVQNa0/IgltIXquZ1vOonVFK4B
X-Proofpoint-ORIG-GUID: Lu0P-03SX7W2JEHanQh5Xd65TCzPzxnG
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68436e91 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=0-2u5t-MAw8Ac9FEvgEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_154123_205052_847C6F6B 
X-CRM114-Status: GOOD (  11.28  )
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

On 2/26/2025 3:34 AM, Lingbo Kong wrote:
> On 2025/2/10 13:40, Lingbo Kong wrote:
>> Currently, command “iw wlan0 station dump” does not show per-chain signal
>> strength.
>>
>> This is because ath12k does not handle the num_per_chain_rssi and
>> rssi_avg_beacon reported by firmware to ath12k.
>>
>> To address this, update ath12k to send WMI_REQUEST_STATS_CMDID with the
>> flag WMI_REQUEST_RSSI_PER_CHAIN_STAT to the firmware. Then, add logic to
>> handle num_per_chain_rssi and rssi_avg_beacon in the
>> ath12k_wmi_tlv_fw_stats_parse(), and assign the resulting per-chain signal
>> strength to the chain_signal of struct station_info.
...
> 
> hi jeff,
> do you have any updates on this patch?🙂

This fell off my radar. Can you rebase since it no longer applies?



