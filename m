Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7CBEB104A
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=; b=MVGcYiEC1yc8UZe9QYU4sUMxwj
	2P9mVS2/iruQCxVYDdQgFfQ2PnSBZvi49U84+zQND/bdrVnNbP3vcV7B8B2sYBGBMqbPgBi3Lz3q9
	IwuMa6Gp0jD4Q69uHzcw5CHsr+8qwvXQqS6LHRuMJ+quBgZZf2kU5m8kp0PwXIqkTcPrvzCtP+6CF
	JiQv4meuD7x/tbTdWR1a6oMQ/aAf++85B8DQwA1396hCfxRP07SN3zkr8UJ5AaxHje+ZESCuGG0YZ
	JWpU/WA6aZ6Y7rEeGDgT6WiW0SL/yUuwmJpRWMharVcOaVA8OpZ1Q1n85WlRxihL+1L0QKLxZ0pdz
	RizaEv1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv6m-00000009GZG-3qWx;
	Tue, 10 Mar 2026 11:18:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzv6k-00000009GYt-0n8G
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 11:18:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wIQT3124446
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 11:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=; b=QlYfu5XVNEkLdax4
	a6RFt/XIRvfaWo7pRocjrUBpjbEbQeqOXh5SHNJQ8SdbbPlqTJTKfZyByzBoHN2R
	UQ+swfGgHjjVi6Dls7b07hgv4f461JNLHeobjgTODAQhoqlJQCII/FMcPTnD2hdk
	5+XQuc4k/dIBotnY9whumegQUwBzME05a1AZazAoqeTBUxSCNNqD7wU1HTgbpqIC
	sq7ZmA/s9lcP0D4x2p4zdDyp89oa54L2zr4xIRlMaj4pDZe3Z/nPpOsMDAjYqu19
	96RrikdGvPTXcWTFV2A0jaFmjxoo7hqaIIMS/PMjLI2qyqRac2/IgyEr/IM+T4Yo
	PQm6TQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0t6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 11:18:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd97debc51so28561485a.1
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141516; x=1773746316; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=;
        b=PFHXveJORF3y75x07m5QIw/CVwCq7AUoQWG2Tf15UcnhNhABndF+xVLPnZFTTFwjLn
         iyaokNCb9n3RKeAeA+oSI/LUO7+ynjQkE/oBTn3tuaMnJTe6Gxs3Z0UGxNcOTNFHwMmU
         RNTqLwOgDfFVJstvsBJfYJwJGrhop34YTkUxakABtnWXVvMuOx+mAr90Ow7qvJ5mWp6g
         V1xua54B2Z7xOqdEnOT1vj/Fp8bw/ot4ffS1PfqSlvZ7rRE8IdEHmdkq7xXSkCsIAccL
         51AcqVXiikIb+0+DM/5nLO+V5EE8gvLUYPPTZ1ya06ixiLAROyG2Gk/3ux2DhHAagduJ
         0ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141516; x=1773746316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=;
        b=GpqtSiIi0HCexWKukDIJ5Yf0eA4xET9eSSbG3/Fr0FqJt/jrdyIqnPmhv+BJU1kFLg
         p9Aie3J1O+c430hjP6DQf5VStfwhI5fZmQxSUpp4OOchrKtkYeay9aDf/aZ++0TKaHHy
         qfnxQMEOP/2uVD+qXKzaG0XCEUM9kBplsACy9J2SbQMvp3Drfr76D4owkPDUfyyXL/UE
         vRP7ACosRBYsbqKn9nd4jEuy/08LBvBcoIcvChP9XQN/FushAVHYS7GjxH9KoDlMUnBK
         s/Vl9PHsg+V+947W5U9qzvhJO42Nk5VvSa2Ev8hFoTNREYyjIQCqHU5r1lSk6Y5XZ/sw
         h9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUxPR2ZYU9KZ5SYFk5btotOEcpAGtXTpVFhX8pAZFbkF0zolxtbU41N66jPfcAXY4GQGJb1eEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YymUJEis9lPK6uCMZKaTmTtKaz4z3CH7c8i0V+iLWBcjrv/oj3J
	a+UJQtdWq0voAYXzjkxrEFxB1DMUydtnkCVVtR5QtnmtMLn9lmhEhu19SHnuLssWSQtTOf9YeH+
	UM6tw/9WCYWiBnC+46I2TShVKjoQVO4aCle9ut+IO4lukbDrXngyBX/N9eVot048i
X-Gm-Gg: ATEYQzynV4xE8M9yJUa/m/degXRL9szdYxbWpvVVT/osyoq+fimneCTuNUF80a/WWuz
	ndF0K/ayAKUeCv/ZIlMWJ7hCrq3HvXT+E1TPhlQuW+iDfN7+q46/39gOVFcCShDyxcOhFEj0QsK
	JQpXFJIaEeMlO5YsD78pKrpmLmN6jIPDxdfaeERu5Pw3pzS42F/Ji6JpgG47v9dD/L1mjqgJyJn
	Kh/e/fRd2ThX8hwNM4bm+Av4/5C4ud4PcAQEucjckwvy4BcE2NxA/eNmVXFSXJDMZ+ZHg1hv3KZ
	daMbEkSVXkL9VT7MaaDYcdXi1iqxfGCnQdaeL94i+k3eJEZa9/zyfcP9SuiA8e7GTARvcHKw2ZD
	TYPjoXv8YekFTfQzw/trzPiRczssr61WN1SmNCW84AEOJOuiTcPmh88S/Axxfxy19/BxB1Jl2IA
	ENuS4=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr437809985a.7.1773141516320;
        Tue, 10 Mar 2026 04:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr437806885a.7.1773141515744;
        Tue, 10 Mar 2026 04:18:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e9esm4078116a12.21.2026.03.10.04.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:18:34 -0700 (PDT)
Message-ID: <a96cca02-54e4-4ed0-9fcb-816c72afe0e7@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>
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
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org> <aa6O5tir4kVIe0eZ@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa6O5tir4kVIe0eZ@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69affe0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1RngqAJXY2j47DovaP0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 80aGv3yPJ8gb896gkSLG97ljvCjjogiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5NyBTYWx0ZWRfX9B9VCd3YmcVR
 4LdpIf4KN3Zh5LGd0IobZ/YWUn4GXTn7HhiQUvkI01aSpFrAZLsCvJv453NjaC6KD8HHT1lVram
 JQt701C6+ift8gE40/Im+PVH+gck2SZRHKBoJ12rhV3rP/6ZBfaNA1Sh/gc+tXqarhBHWJfhIR/
 +1nEf0Bo48lGlQqCpHnKtHWjRJeijM059/eiJ861ldRmkZ5i7tyJn+J1JbAUrOtisDKIU/39iOA
 x4IOu3WsTDO5yK9W28caPXuOBwJR6bcVLSfwQC4VDt3hw5gujbpJZnsPFgHgxUiYthnht4d7ypS
 KHrdNNQTgPTofFWkcW6oZEb+YET8tPqOubbSlqELly5RityrxPfTza7S1dew4rS6ione5abYPYu
 NOe1NVPgSt357AGViwLmpuJyR1xIbek6P9+ge/nHr2zpdIwwBlqb9+3QVNc0uDGNfSjWjpozNQz
 +xkIv3d2uhAbPJaQcrw==
X-Proofpoint-ORIG-GUID: 80aGv3yPJ8gb896gkSLG97ljvCjjogiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_041838_385622_AC0DA0C4 
X-CRM114-Status: GOOD (  11.45  )
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

On 3/9/26 10:12 AM, Jorge Ramirez wrote:
> On 06/03/26 16:20:24, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
>> TZ service allows to support multiple TZ implementation backends like QTEE
>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
>> backend service.
>>
>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> ---

[...]

> are the calls to set_remote_state required?
> 0 is not the IRIS/VENUS remote processor.
> 
> If it is legacy, maybe they can be phased out?

FWIW, in msm-3.10 (yes) QCOM_SCM_SVC_BOOT/0x0a used to be called
'TZBSP_VIDEO_SET_STATE', taking the arguments:

args[0] = suspend->0, resume->1
args[1] = spare=0

seems like sdm845/msm-4.9 still had that and so did 8250/msm-4.19

Konrad

